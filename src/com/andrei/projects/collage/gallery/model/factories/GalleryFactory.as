package com.andrei.projects.collage.gallery.model.factories {

import com.andrei.projects.collage.gallery.model.vo.Gallery;
import com.andrei.projects.collage.gallery.model.vo.GalleryImage;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.display.ContentDisplay;

import flash.errors.IOError;

public class GalleryFactory implements IGalleryFactory {

    public function createGallery(loader:LoaderMax, size:int):Gallery {
        if (!(loader is LoaderMax)) {
            throw new IOError("loader must be LoaderMax")
        }
        // Init gallery
        var gallery:Gallery = new Gallery();
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
}
}