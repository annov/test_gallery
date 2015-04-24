package com.andrei.projects.collage.gallery.model.vo {
[Bindable]
public interface IGallery {
    function get photos():Vector.<IGalleryImage>;

    function set photos(value:Vector.<IGalleryImage>):void;

    function get reserve():Vector.<IGalleryImage>;

    function set reserve(value:Vector.<IGalleryImage>):void;
}
}