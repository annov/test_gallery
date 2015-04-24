package com.andrei.projects.collage.gallery.model.factories {
import com.andrei.projects.collage.gallery.model.vo.Gallery;
import com.greensock.loading.LoaderMax;

public interface IGalleryFactory {
    function createGallery(loader:LoaderMax, size:int):Gallery;
}
}