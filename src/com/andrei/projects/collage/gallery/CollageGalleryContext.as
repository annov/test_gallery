package com.andrei.projects.collage.gallery {
import com.andrei.projects.collage.gallery.controller.LoadGalleryCommand;
import com.andrei.projects.collage.gallery.model.factories.*;
import com.andrei.projects.collage.gallery.service.*;
import com.andrei.projects.collage.gallery.signals.*;
import com.andrei.projects.collage.gallery.view.CollageGalleryUIMediator;
import com.andrei.projects.collage.gallery.view.ui.CollageGalleryUI;

import flash.display.DisplayObjectContainer;

import org.robotlegs.mvcs.SignalContext;


public class CollageGalleryContext extends SignalContext {
    public function CollageGalleryContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        // map the views
        mediatorMap.mapView(CollageGalleryUI, CollageGalleryUIMediator);

        // map the services and their factories
        injector.mapSingletonOf(IGalleryImageService, GalleryImageService);
        injector.mapSingletonOf(IGalleryFactory, GalleryFactory);

        // map the signals
        injector.mapSingleton(GalleryLoadedSignal);
        injector.mapSingleton(GalleryImageSelectedSignal);

        ApplicationStartedSignal(signalCommandMap.mapSignalClass(ApplicationStartedSignal, LoadGalleryCommand, true)).dispatch();
        // add gallery view
        contextView.addChild(new CollageGalleryUI());
    }
}
}
