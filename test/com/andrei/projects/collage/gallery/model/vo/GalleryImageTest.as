package com.andrei.projects.collage.gallery.model.vo {
import asunit.framework.TestCase;

public class GalleryImageTest extends TestCase {
    protected var instance:GalleryImage;
    protected static const IMAGE_X:Number = 63;
    protected static const IMAGE_Y:Number = 26;
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

    public function test_set_x():void
    {
        instance.x = IMAGE_X;
        assertEquals("Set workspaceColor", IMAGE_X, instance.x);
    }

    public function test_set_y():void
    {
        instance.y = IMAGE_Y;
        assertEquals("Set workspaceColor", IMAGE_Y, instance.y);
    }
}
}
