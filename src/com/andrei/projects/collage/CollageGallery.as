package com.andrei.projects.collage {

import com.andrei.projects.collage.gallery.CollageGalleryContext;

import flash.display.Sprite;

[SWF(width="800", height="600")]
public class CollageGallery extends Sprite {
    public function CollageGallery() {
        context = new CollageGalleryContext(this);
    }

    protected var context:CollageGalleryContext;
}
}
