{if="!$communities->isEmpty()"}
<ul class="list middle flex third all fill padded_top_bottom">
    <li class="subheader block large">
        <div>
            <p>{$c->__('communitiesinteresting.about')}</p>
        </div>
    </li>
    {loop="$communities"}
        <li
            class="block active"
            onclick="MovimUtils.reload('{$c->route('community', [$value->server, $value->node])}')"
            title="{$value->server} - {$value->node}"
        >
            <span class="primary icon bubble">
                <img src="{$value->getPhoto('m')}"/>
            </span>
            <span class="control icon gray">
                <i class="material-icons">chevron_right</i>
            </span>
            <div>
                <p class="line normal">
                    {if="$value->name"}
                        {$value->name}
                    {else}
                        {$value->node}
                    {/if}
                    {if="$value->description"}
                        <span class="second">
                            {$value->description|strip_tags}
                        </span>
                    {/if}
                </p>
                <p class="line">
                    {$value->server} / {$value->node}
                </p>
            </div>
        </li>
    {/loop}
</ul>
<br />
<hr />
{/if}
