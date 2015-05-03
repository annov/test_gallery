package com.andrei.projects.collage.gallery.model.factories {

import com.andrei.projects.collage.gallery.model.vo.Gallery;
import com.andrei.projects.collage.gallery.model.vo.GalleryImage;
import com.andrei.projects.collage.gallery.model.vo.IGallery;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.andrei.projects.collage.gallery.signals.GalleryUpdatedSignal;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.display.ContentDisplay;

import flash.errors.IOError;

public class GalleryFactory implements IGalleryFactory {
    [Inject]
    public var galleryUpdated:GalleryUpdatedSignal;

    private var _gallery:IGallery;

    public function get gallery():IGallery {
        return _gallery;
    }

    public function set gallery(value:IGallery):void {
        _gallery = value;
    }

    public function createGallery(loader:LoaderMax, size:int):IGallery {
        if (!(loader is LoaderMax)) {
            throw new IOError("loader must be LoaderMax")
        }
        // Init gallery
        gallery = new Gallery();
        var photo:GalleryImage;
        for each (var content:ContentDisplay in loader.content) {
            if (gallery.photos.length < size) {
                // Add current photos
                photo = new GalleryImage();
                photo.content = content;
                gallery.photos.push(photo);
            } else {
                // Add reserve photos
                photo = new GalleryImage();
                photo.content = content;
                gallery.reserve.push(photo);
            }
        }
        return gallery;
    }
    // Switch image between current gallery and reserves
    // Remove selected image and add new image
    public function updateGallery(selected:IGalleryImage):void {
        var added:IGalleryImage;
        gallery.photos.splice(gallery.photos.indexOf(selected), 1);
        gallery.reserve.push(selected);
        added = gallery.reserve.shift();
        gallery.photos.push(added);
        galleryUpdated.dispatch(gallery, added);
    }
}
}