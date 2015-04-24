package com.andrei.projects.collage.gallery.controller {
import com.andrei.projects.collage.gallery.service.IGalleryImageService;

import org.robotlegs.mvcs.Command;

public class LoadGalleryCommand extends Command {
    [Inject]
    public var service:IGalleryImageService;

    override public function execute():void {
        service.loadGallery();
    }
}
}