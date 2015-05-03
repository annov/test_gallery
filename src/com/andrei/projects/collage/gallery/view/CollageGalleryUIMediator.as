package com.andrei.projects.collage.gallery.view {
import com.andrei.projects.collage.gallery.model.vo.IGallery;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.andrei.projects.collage.gallery.signals.GalleryEnabledSignal;
import com.andrei.projects.collage.gallery.signals.GalleryImageSelectedSignal;
import com.andrei.projects.collage.gallery.signals.GalleryLayoutUpdatedSignal;
import com.andrei.projects.collage.gallery.signals.GalleryLoadedSignal;
import com.andrei.projects.collage.gallery.signals.GalleryUpdatedSignal;
import com.andrei.projects.collage.gallery.view.ui.CollageGalleryUI;

import org.robotlegs.mvcs.Mediator;

public class CollageGalleryUIMediator extends Mediator {
    [Inject]
    public var view:CollageGalleryUI;
    [Inject]
    public var loaded:GalleryLoadedSignal;
    [Inject]
    public var updated:GalleryUpdatedSignal;
    [Inject]
    public var enableGallery:GalleryEnabledSignal;
    [Inject]
    public var selected:GalleryImageSelectedSignal;
    [Inject]
    public var updateGalleryLayout:GalleryLayoutUpdatedSignal;

    override public function onRegister():void {
        loaded.add(galleryLoaded);
        updated.add(galleryUpdated);
        selected.add(removeSelected);
        view.galleryEnabled.add(handleGalleryEnabled);
        view.layoutUpdated.add(handleGalleryLayoutUpdated);
    }

    protected function handleGalleryEnabled():void {
        enableGallery.dispatch();
    }

    protected function handleGalleryLayoutUpdated():void {
        updateGalleryLayout.dispatch();
    }

    private function galleryLoaded(gallery:IGallery):void {
        view.addGallery(gallery);
    }

    private function galleryUpdated(gallery:IGallery, added:IGalleryImage):void {
        view.updateGallery(gallery, added);
    }

    private function removeSelected(selected:IGalleryImage):void {
        view.removeSelectedImage(selected);
    }
}
}
