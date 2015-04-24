package com.andrei.projects.collage.gallery.model.vo {
import com.greensock.loading.display.ContentDisplay;

[Bindable]
public interface IGalleryImage {
    function get content():ContentDisplay;

    function set content(v:ContentDisplay):void;

    function get x():Number;

    function set x(v:Number):void;

    function get y():Number;

    function set y(v:Number):void;
}
}