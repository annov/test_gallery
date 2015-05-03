package com.andrei.projects.collage.gallery.view.components {
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.greensock.TweenMax;
import com.greensock.easing.Sine;

import flash.display.Sprite;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

public class ImageComponent extends Sprite {

    public function ImageComponent() {

    }

    public function init(visible:Boolean = true):void {
        addChild(image.content);
        if (visible) {
            alpha = 0.8;
            x = image.x;
            y = image.y;
        } else {
            alpha = 0;
        }
    }

    public var imageSelected:Signal = new Signal(IGalleryImage);
    public var galleryEnabled:Signal = new Signal();
    public var galleryDisabled:Signal = new Signal();

    private var _image:IGalleryImage;

    public function get image():IGalleryImage {
        return _image;
    }

    public function set image(value:IGalleryImage):void {
        _image = value;
    }

    public function updatePosition():void {
        TweenMax.to(this, 1.5, {alpha: 0.8, x: image.x, y: image.y, ease: Sine.easeInOut, onComplete: enableButtons});
    }

    // Add image listeners
    public function addListeners():void {
        addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
        addEventListener(MouseEvent.ROLL_OUT, mouseOverHandler);
        addEventListener(MouseEvent.CLICK, mouseClickHandler);
    }

    // Remove image listeners
    public function removeListeners():void {
        removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
        removeEventListener(MouseEvent.ROLL_OUT, mouseOverHandler);
        removeEventListener(MouseEvent.CLICK, mouseClickHandler);
    }

    // Enable all image buttons
    private function enableButtons():void {
        galleryEnabled.dispatch();
    }

    private function onFadeOut():void {
        imageSelected.dispatch(image);
    }

    // On mouse over or mouse out
    private function mouseOverHandler(e:MouseEvent):void {
        var mouseOver:Boolean = e.type == MouseEvent.ROLL_OVER;
        // Change image state
        TweenMax.killTweensOf(this);
        if (mouseOver) {
            TweenMax.to(this, 0.5, {alpha: 1, ease: Sine.easeOut});
        } else {
            TweenMax.to(this, 0.5, {alpha: 0.8, ease: Sine.easeIn});
        }
    }

    // On mouse click
    private function mouseClickHandler(e:MouseEvent):void {
        galleryDisabled.dispatch();
        // Hide selected image
        TweenMax.killTweensOf(this);
        TweenMax.to(this, 0.5, {alpha: 0, ease: Sine.easeIn, onComplete: onFadeOut});
    }
}
}
