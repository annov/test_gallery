package com.andrei.projects.collage.gallery.view.components {
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.andrei.projects.collage.gallery.signals.GalleryDisabledSignal;
import com.andrei.projects.collage.gallery.signals.GalleryEnabledSignal;
import com.andrei.projects.collage.gallery.signals.GalleryImageSelectedSignal;
import com.andrei.projects.collage.gallery.signals.GalleryLayoutUpdatedSignal;

import org.robotlegs.mvcs.Mediator;

public class ImageComponentMediator extends Mediator {
    [Inject]
    public var view:ImageComponent;
    [Inject]
    public var enabled:GalleryEnabledSignal;
    [Inject]
    public var disabled:GalleryDisabledSignal;
    [Inject]
    public var layoutUpdated:GalleryLayoutUpdatedSignal;
    [Inject]
    public var selectImage:GalleryImageSelectedSignal;
    [Inject]
    public var enableGallery:GalleryEnabledSignal;
    [Inject]
    public var disableGallery:GalleryDisabledSignal;

    override public function onRegister():void {
        enabled.add(galleryEnabled);
        disabled.add(galleryDisabled);
        layoutUpdated.add(galleryLayoutUpdated);
        view.imageSelected.add(handleImageSelected);
        view.galleryEnabled.add(handleGalleryEnabled);
        view.galleryDisabled.add(handleGalleryDisabled);
    }

    protected function handleImageSelected(selected:IGalleryImage):void {
        selectImage.dispatch(selected);
    }

    protected function handleGalleryEnabled():void {
        enableGallery.dispatch();
    }

    protected function handleGalleryDisabled():void {
        disableGallery.dispatch();
    }

    private function galleryEnabled():void {
        view.addListeners();
    }

    private function galleryDisabled():void {
        view.removeListeners();
    }

    private function galleryLayoutUpdated():void {
        view.updatePosition();
    }
}
}
