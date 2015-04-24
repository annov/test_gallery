package com.andrei.projects.collage.gallery.view {
import com.andrei.projects.collage.gallery.model.vo.Gallery;
import com.andrei.projects.collage.gallery.signals.GalleryLoadedSignal;
import com.andrei.projects.collage.gallery.view.ui.CollageGalleryUI;

import org.robotlegs.mvcs.Mediator;

public class CollageGalleryUIMediator extends Mediator {
    [Inject]
    public var view:CollageGalleryUI;
    [Inject]
    public var loaded:GalleryLoadedSignal;

    override public function onRegister():void {
        loaded.add(galleryLoaded);
    }

    private function galleryLoaded(gallery:Gallery):void {
        view.addGallery(gallery);
    }
}
}
