package com.andrei.projects.collage.gallery.signals {
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;

import org.osflash.signals.Signal;

public class GalleryImageSelectedSignal extends Signal {
    public function GalleryImageSelectedSignal() {
        super(IGalleryImage);
    }
}
}