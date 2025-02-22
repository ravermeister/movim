{if="!empty($results)"}
    <li class="subheader">
        <div>
            <p>{$c->__('roomsexplore.global_title')}</p>
        </div>
    </li>
    {loop="$results"}
        <li title="{$value.jid}">
            {if="$vcards->has($value['jid'])"}
                <span class="primary icon bubble"
                    style="background-image: url({$vcards->get($value['jid'])->getPhoto()});">
                </span>
            {else}
                <span class="primary icon bubble color {$value.name|stringToColor}">
                    {$value.name|firstLetterCapitalize}
                </span>
            {/if}
            {if="$bookmarks->has($value['jid'])"}
                <span class="control icon gray">
                    <i class="material-icons">bookmark</i>
                </span>
            {else}
                <span class="control icon gray active divided"
                    onclick="Drawer.clear(); RoomsUtils_ajaxAdd('{$value.jid}', '{$value.name}')">
                    <i class="material-icons">add</i>
                </span>
            {/if}

            <div>
                <p class="line">
                    {$value.name}
                    <span class="second">{$value.jid}</span>
                </p>
                <p class="line" title="{$value.description}">
                    {if="$value.occupants > 0"}
                        <span title="{$c->__('communitydata.sub', $value.occupants)}">
                            {$value.occupants} <i class="material-icons">people</i>
                        </span>
                    {/if}
                    {if="$value.occupants > 0 && !empty($value.description)"} · {/if}
                    {$value.description}
                </p>
            </div>
        </li>
    {/loop}
{else}
    <div class="placeholder">
        <i class="material-icons">language</i>
        <h1>{$c->__('roomsexplore.no_global')}</h1>
    </div>
{/if}