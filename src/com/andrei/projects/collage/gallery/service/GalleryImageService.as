package com.andrei.projects.collage.gallery.service {

import com.andrei.projects.collage.gallery.model.factories.IGalleryFactory;
import com.andrei.projects.collage.gallery.model.vo.IGallery;
import com.andrei.projects.collage.gallery.signals.GalleryLoadedSignal;
import com.greensock.events.LoaderEvent;
import com.greensock.loading.ImageLoader;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.XMLLoader;

import flash.errors.IOError;

public class GalleryImageService implements IGalleryImageService {
    protected static const BASE_URL:String = "../../../assets/gallery/";
    protected static const GALLERY_SIZE:Number = 10;

    public function GalleryImageService() {
        super();
    }

    [Inject]
    public var galleryFactory:IGalleryFactory;
    [Inject]
    public var galleryLoaded:GalleryLoadedSignal;

    public function loadGallery():void {
        loadXML();
    }

    // Load xml with image data
    private function loadXML():void {
        var xml:XMLLoader = new XMLLoader(BASE_URL + "gallery.xml",
                {
                    name: "mainXML",
                    onComplete: handleXMLResult,
                    onFail: handleXMLFault,
                    estimatedBytes: 4000
                });
        xml.load();
    }

    // Load images
    private function loadImages(input:Object):void {
        if (!(input is XMLList)) {
            throw new IOError("input must be XMLList")
        }
        var loader:LoaderMax = new LoaderMax({onComplete: handleServiceResult, onFail: handleServiceFault});
        for each (var image:XML in input) {
            loader.append(new ImageLoader(BASE_URL + "images/" + image.@name + '.jpg', {
                name: image.@name
            }));
        }
        loader.load();
    }

    // On xml loaded
    protected function handleXMLResult(event:LoaderEvent):void {
        var xml:XMLLoader = event.target as XMLLoader;
        loadImages(xml.content.image);
    }

    // On xml load failed
    protected function handleXMLFault(event:LoaderEvent):void {
        trace(event);
    }

    // On images loaded
    protected function handleServiceResult(event:LoaderEvent):void {
        var loader:LoaderMax = event.target as LoaderMax;
        var gallery:IGallery = galleryFactory.createGallery(loader, GALLERY_SIZE);
        galleryLoaded.dispatch(gallery);
    }

    // On images failed
    protected function handleServiceFault(event:LoaderEvent):void {
        trace(event);
    }
}
}