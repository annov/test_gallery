package com.andrei.projects.collage.gallery.model.vo {
import com.greensock.loading.display.ContentDisplay;

public class GalleryImage implements IGalleryImage {
    protected var _content:ContentDisplay;

    public function get content():ContentDisplay {
        return _content;
    }

    public function set content(v:ContentDisplay):void {
        _content = v;
    }

    protected var _x:Number;

    public function get x():Number {
        return _x;
    }

    public function set x(v:Number):void {
        _x = v;
    }

    protected var _y:Number;

    public function get y():Number {
        return _y;
    }

    public function set y(v:Number):void {
        _y = v;
    }

}
}