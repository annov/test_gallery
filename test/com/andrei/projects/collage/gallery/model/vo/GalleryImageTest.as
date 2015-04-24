package com.andrei.projects.collage.gallery.model.vo {
import asunit.framework.TestCase;

public class GalleryImageTest extends TestCase {
    protected var instance:GalleryImage;
    public function GalleryImageTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new GalleryImage();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is GalleryImage", instance is GalleryImage);
    }

    public function testIsIGalleryImage():void{
        assertTrue("instance is IGalleryImage", instance is IGalleryImage);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
