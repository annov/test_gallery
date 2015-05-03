package com.andrei.projects.collage.gallery.view.components {
import asunit.framework.TestCase;

import com.andrei.projects.collage.gallery.model.vo.GalleryImage;
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;

import flash.display.Sprite;

public class ImageComponentTest extends TestCase {
    protected var instance:ImageComponent;
    protected static const GALLERY_IMAGE:IGalleryImage = new GalleryImage();
    public function ImageComponentTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new ImageComponent();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is ImageComponent", instance is ImageComponent);
    }

    public function testIsSprite():void{
        assertTrue("instance is Sprite", instance is Sprite);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }

    public function test_set_image():void
    {
        instance.image = GALLERY_IMAGE;
        assertEquals("Set image", GALLERY_IMAGE, instance.image);
    }
}
}
