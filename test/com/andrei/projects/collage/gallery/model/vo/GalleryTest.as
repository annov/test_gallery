package com.andrei.projects.collage.gallery.model.vo {
import asunit.framework.TestCase;

public class GalleryTest extends TestCase {
    protected var instance:Gallery;
    protected static const GALLERY_IMAGES:Vector.<IGalleryImage> = Vector.<IGalleryImage>([new GalleryImage(), new GalleryImage()]);

    public function GalleryTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new Gallery();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is Gallery", instance is Gallery);
    }

    public function testIsIGallery():void{
        assertTrue("instance is IGallery", instance is IGallery);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }

    public function test_set_photos():void
    {
        instance.photos = GALLERY_IMAGES;
        assertEquals("Set photos", GALLERY_IMAGES, instance.photos);
    }

    public function test_set_reserve():void
    {
        instance.reserve = GALLERY_IMAGES;
        assertEquals("Set reserve", GALLERY_IMAGES, instance.reserve);
    }
}
}
