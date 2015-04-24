package com.andrei.projects.collage.gallery.model.vo {
import asunit.framework.TestCase;

public class GalleryTest extends TestCase {
    protected var instance:Gallery;
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
}
}
