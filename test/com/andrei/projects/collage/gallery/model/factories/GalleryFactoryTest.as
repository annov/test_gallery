package com.andrei.projects.collage.gallery.model.factories {
import asunit.framework.TestCase;

import com.andrei.projects.collage.gallery.model.vo.Gallery;
import com.andrei.projects.collage.gallery.model.vo.IGallery;

public class GalleryFactoryTest extends TestCase {
    protected var instance:GalleryFactory;
    protected static const GALLERY:IGallery = new Gallery();
    public function GalleryFactoryTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new GalleryFactory();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is GalleryFactory", instance is GalleryFactory);
    }

    public function testIsIGalleryFactory():void{
        assertTrue("instance is IGalleryFactory", instance is IGalleryFactory);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }

    public function test_set_gallery():void
    {
        instance.gallery = GALLERY;
        assertEquals("Set workspaceColor", GALLERY, instance.gallery);
    }
}
}
