package com.andrei.projects.collage.gallery.service {
import asunit.framework.TestCase;

public class GalleryImageServiceTest extends TestCase {
    protected var instance:GalleryImageService;
    public function GalleryImageServiceTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new GalleryImageService();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is GalleryImageService", instance is GalleryImageService);
    }

    public function testIsIGalleryImageService():void{
        assertTrue("instance is IGalleryImageService", instance is IGalleryImageService);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
