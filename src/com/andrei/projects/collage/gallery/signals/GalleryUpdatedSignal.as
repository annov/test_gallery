package com.andrei.projects.collage.gallery.signals {
import com.andrei.projects.collage.gallery.model.vo.IGallery;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;

import org.osflash.signals.Signal;

public class GalleryUpdatedSignal extends Signal {
    public function GalleryUpdatedSignal() {
        super(IGallery, IGalleryImage);
    }
}
}
