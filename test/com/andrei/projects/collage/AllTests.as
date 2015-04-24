package com.andrei.projects.collage {
import asunit.framework.TestSuite;

import com.andrei.projects.collage.gallery.CollageGalleryContextTest;
import com.andrei.projects.collage.gallery.controller.LoadGalleryCommandTest;
import com.andrei.projects.collage.gallery.model.factories.GalleryFactoryTest;
import com.andrei.projects.collage.gallery.model.vo.GalleryImageTest;
import com.andrei.projects.collage.gallery.model.vo.GalleryTest;
import com.andrei.projects.collage.gallery.service.GalleryImageServiceTest;
import com.andrei.projects.collage.gallery.view.CollageGalleryUIMediatorTest;
import com.andrei.projects.collage.gallery.view.components.CollageLayoutTest;
import com.andrei.projects.collage.gallery.view.components.TextComponentTest;
import com.andrei.projects.collage.gallery.view.ui.CollageGalleryUITest;

public class AllTests extends TestSuite {
    public function AllTests() {
        addTest(new CollageGalleryContextTest());
        addTest(new LoadGalleryCommandTest());
        addTest(new GalleryFactoryTest());
        addTest(new GalleryTest());
        addTest(new GalleryImageTest());
        addTest(new GalleryImageServiceTest());
        addTest(new CollageLayoutTest());
        addTest(new TextComponentTest());
        addTest(new CollageGalleryUITest());
        addTest(new CollageGalleryUIMediatorTest());
    }
}
}
