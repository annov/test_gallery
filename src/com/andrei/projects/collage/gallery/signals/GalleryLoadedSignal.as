package com.andrei.projects.collage.gallery.signals {
import com.andrei.projects.collage.gallery.model.vo.IGallery;

import org.osflash.signals.Signal;

public class GalleryLoadedSignal extends Signal {
    public function GalleryLoadedSignal() {
        super(IGallery);
    }
}
}