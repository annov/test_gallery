package com.andrei.projects.collage.gallery.view.ui {

import com.andrei.projects.collage.gallery.model.vo.Gallery;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.andrei.projects.collage.gallery.view.components.CollageLayout;
import com.andrei.projects.collage.gallery.view.components.TextComponent;
import com.greensock.TweenMax;
import com.greensock.easing.Sine;
import com.greensock.loading.display.ContentDisplay;

import fl.containers.ScrollPane;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class CollageGalleryUI extends Sprite {
    public function CollageGalleryUI() {
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private var _holder:Sprite;
    private var _scrollPane:ScrollPane;
    private var _layout:CollageLayout;
    private var _uploadedGallery:Gallery;

    public function addGallery(gallery:Gallery):void {
        _uploadedGallery = gallery;
        updateGallery(true);
        enableButtons();
    }

    private function addBackground():void {
        graphics.beginFill(0x111111);
        graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
    }

    private function addScrollPane():void {
        // Image imagesHolder and layout
        _holder = new Sprite();
        _layout = new CollageLayout();
        _layout.width = stage.stageWidth - 20;
        // Scroll pane
        _scrollPane = new ScrollPane();
        _scrollPane.setSize(stage.stageWidth, stage.stageHeight - 50);
        _scrollPane.move(0, 50);
        // Empty background
        _scrollPane.setStyle("skin", MovieClip);
        _scrollPane.setStyle("upSkin", MovieClip);

        addChild(_scrollPane);
    }

    private function updateGallery(init:Boolean = false):void {
        // Set new layout
        _layout.update(_uploadedGallery.photos);
        for each (var image:IGalleryImage in _uploadedGallery.photos) {
            // Add image and listeners
            if (!_holder.contains(image.content)) {
               if (init) {
                   image.content.alpha = 0.8;
               }
                _holder.addChild(image.content);
            }
            if (init) {
                image.content.x = image.x;
                image.content.y = image.y;
            }
        }
        // Update scroll pane
        _scrollPane.source = _holder;
        // Animate images to new position
        for each (image in _uploadedGallery.photos) {
            if (init) {
                break;
            }
            TweenMax.to(image.content, 1.5, {x: image.x, y: image.y, ease: Sine.easeInOut});
        }
        // Update scroll pane
        _scrollPane.source = _holder;
    }

    // Switch image between current gallery and reserves
    // Remove selected image and add new image
    private function onFadeOut(selected:ContentDisplay):void {
        var image:IGalleryImage;
        for each (image in _uploadedGallery.photos) {
            if (image.content == selected) {
                _holder.removeChild(selected);
                _uploadedGallery.photos.splice(_uploadedGallery.photos.indexOf(image), 1);
                _uploadedGallery.reserve.push(image);
                image = _uploadedGallery.reserve.shift();
                _uploadedGallery.photos.push(image);
                break;
            }
        }
        updateGallery();
        // Show added image
        TweenMax.to(image.content, 2, {alpha: 0.8, ease: Sine.easeOut, onComplete: enableButtons});
    }

    // Enable/disable all image buttons
    private function enableButtons(enable:Boolean = true):void {
        for each (var image:IGalleryImage in _uploadedGallery.photos) {
            if (enable) {
                addListeners(image.content);
            } else {
                removeListeners(image.content);
            }
        }
    }

    // Add image listeners
    private function addListeners(button:ContentDisplay):void {
        button.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
        button.addEventListener(MouseEvent.ROLL_OUT, mouseOverHandler);
        button.addEventListener(MouseEvent.CLICK, mouseClickHandler);
    }

    // Remove image listeners
    private function removeListeners(button:ContentDisplay):void {
        button.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
        button.removeEventListener(MouseEvent.ROLL_OUT, mouseOverHandler);
        button.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
    }

    // Init gallery view components
    private function init(e:Event):void {
        addBackground();
        addScrollPane();
        addChild(new TextComponent());
    }

    // On mouse over or mouse out
    private function mouseOverHandler(e:MouseEvent):void {
        var mouseOver:Boolean = e.type == MouseEvent.ROLL_OVER;
        var button:ContentDisplay = e.target as ContentDisplay;
        // Change image state
        TweenMax.killTweensOf(button);
        if (mouseOver) {
            TweenMax.to(button, 0.5, {alpha: 1, ease: Sine.easeOut});
        } else {
            TweenMax.to(button, 0.5, {alpha: 0.8, ease: Sine.easeIn});
        }
    }

    // On mouse click
    private function mouseClickHandler(e:MouseEvent):void {
        var button:ContentDisplay = e.target as ContentDisplay;
        enableButtons(false);
        // Hide selected image
        TweenMax.killTweensOf(button);
        TweenMax.to(button, 0.5, {alpha: 0, ease: Sine.easeIn, onComplete: onFadeOut, onCompleteParams: [button]});
    }
}
}
