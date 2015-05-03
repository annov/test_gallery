package com.andrei.projects.collage.gallery.model.factories {
import com.andrei.projects.collage.gallery.model.vo.IGallery;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.greensock.loading.LoaderMax;

public interface IGalleryFactory {
    function get gallery():IGallery;

    function set gallery(value:IGallery):void;

    function createGallery(loader:LoaderMax, size:int):IGallery;

    function updateGallery(selected:IGalleryImage):void;
}
}