package com.andrei.projects.collage.gallery.view.ui {

import com.andrei.projects.collage.gallery.model.vo.IGallery;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.andrei.projects.collage.gallery.view.components.CollageLayout;
import com.andrei.projects.collage.gallery.view.components.ImageComponent;
import com.andrei.projects.collage.gallery.view.components.TextComponent;

import fl.containers.ScrollPane;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;

import org.osflash.signals.Signal;

public class CollageGalleryUI extends Sprite {
    public function CollageGalleryUI() {
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    public var galleryEnabled:Signal = new Signal();
    public var layoutUpdated:Signal = new Signal();
    private var _holder:Sprite;
    private var _scrollPane:ScrollPane;
    private var _layout:CollageLayout;

    public function addGallery(gallery:IGallery):void {
        var imageComponent:ImageComponent;
        // Set new layout
        _layout.update(gallery.photos);
        for each (var image:IGalleryImage in gallery.photos) {
            // Add image
            imageComponent = new ImageComponent();
            imageComponent.image = image;
            imageComponent.init();
            _holder.addChild(imageComponent);
        }
        updateScrollPane();
        // Enable gallery
        galleryEnabled.dispatch();
    }

    public function updateGallery(gallery:IGallery, added:IGalleryImage):void {
        var imageComponent:ImageComponent;
        // Set new layout
        _layout.update(gallery.photos);
        // Add image
        imageComponent = new ImageComponent();
        imageComponent.image = added;
        imageComponent.init(false);
        _holder.addChild(imageComponent);
        updateScrollPane();
        // Animate images to new position
        layoutUpdated.dispatch();
        updateScrollPane();
    }

    public function removeSelectedImage(selected:IGalleryImage):void {
        var component:ImageComponent;
        for (var i:int = 0; i < _holder.numChildren; i++) {
            component = _holder.getChildAt(i) as ImageComponent;
            if (component.image == selected) {
                _holder.removeChild(component);
                break;
            }
        }
    }

    private function updateScrollPane():void {
        // Update scroll pane
        _scrollPane.source = _holder;
    }

    private function addBackground():void {
        graphics.beginFill(0x111111);
        graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
    }

    private function addScrollPane():void {
        // Scroll pane
        _scrollPane = new ScrollPane();
        _scrollPane.setSize(stage.stageWidth, stage.stageHeight - 50);
        _scrollPane.move(0, 50);
        // Empty background
        _scrollPane.setStyle("skin", MovieClip);
        _scrollPane.setStyle("upSkin", MovieClip);
        addChild(_scrollPane);
    }

    // Init gallery view components
    private function init(e:Event):void {
        addBackground();
        addScrollPane();
        addChild(new TextComponent());
        // Images holder and layout
        _holder = new Sprite();
        _layout = new CollageLayout();
        _layout.width = stage.stageWidth - 20;
    }
}
}
