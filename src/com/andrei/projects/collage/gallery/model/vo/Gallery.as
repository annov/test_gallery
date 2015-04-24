package com.andrei.projects.collage.gallery.model.vo {

public class Gallery implements IGallery {
    private var _reserve:Vector.<IGalleryImage> = new Vector.<IGalleryImage>();

    public function get reserve():Vector.<IGalleryImage> {
        return _reserve;
    }

    [ArrayElementType("com.andrei.projects.collage.gallery.model.vo.GalleryImage")]
    public function set reserve(value:Vector.<IGalleryImage>):void {
        _reserve = value;
    }

    private var _photos:Vector.<IGalleryImage> = new Vector.<IGalleryImage>();

    public function get photos():Vector.<IGalleryImage> {
        return _photos;
    }

    [ArrayElementType("com.andrei.projects.collage.gallery.model.vo.GalleryImage")]
    public function set photos(value:Vector.<IGalleryImage>):void {
        _photos = value;
    }

}
}