package com.andrei.projects.collage.gallery.controller {
import com.andrei.projects.collage.gallery.model.factories.IGalleryFactory;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;

import org.robotlegs.mvcs.Command;

public class UpdateGalleryCommand extends Command {
    [Inject]
    public var factory:IGalleryFactory;
    [Inject]
    public var selected:IGalleryImage;

    override public function execute():void {
        factory.updateGallery(selected);
    }
}
}
