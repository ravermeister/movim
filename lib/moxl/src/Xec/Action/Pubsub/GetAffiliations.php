<?php

namespace Moxl\Xec\Action\Pubsub;

use Moxl\Stanza\Pubsub;
use Moxl\Xec\Action;

class GetAffiliations extends Action
{
    protected $_to;
    protected $_node;

    public function request()
    {
        $this->store();
        Pubsub::getAffiliations($this->_to, $this->_node);
    }

    public function handle(?\SimpleXMLElement $stanza = null, ?\SimpleXMLElement $parent = null)
    {
        $tab = [];
        foreach ($stanza->pubsub->affiliations->children() as $i) {
            $affiliation = (string)$i['affiliation'];

            if (!array_key_exists($affiliation, $tab)) {
                $tab[$affiliation] = [];
            }

            array_push($tab[$affiliation], ['jid' => (string)$i['jid'], 'subid' => (string)$i['subid']]);
        }

        $this->pack(['affiliations' => $tab, 'server' => $this->_to, 'node' => $this->_node]);
        $this->deliver();
    }
}
