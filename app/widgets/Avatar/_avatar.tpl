<ul class="list thick flex">
    <li class="block active" onclick="Avatar_ajaxGetForm()">
        <span
            class="primary icon bubble color {$me->jid|stringToColor}"
            style="background-image: url({$me->getPhoto()})">
        </span>
        <span class="control icon gray">
            <i class="material-icons">chevron_right</i>
        </span>
        <div>
            <p>{$c->__('avatar.change')}</p>
            <p>{$c->__('avatar.upload_new')}</p>
        </div>
    </li>
    <li class="block active" onclick="Avatar_ajaxGetBannerForm()">
        <span
            class="primary icon bubble"
            style="background-image: url({$me->getBanner()})">
        </span>
        <span class="control icon gray">
            <i class="material-icons">chevron_right</i>
        </span>
        <div>
            <p>{$c->__('banner.change')}</p>
            <p>{$c->__('avatar.upload_new')}</p>
        </div>
    </li>
</ul>