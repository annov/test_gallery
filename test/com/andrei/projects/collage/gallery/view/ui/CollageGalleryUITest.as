package com.andrei.projects.collage.gallery.view.ui {
import asunit.framework.TestCase;

import flash.display.Sprite;

public class CollageGalleryUITest extends TestCase {
    protected var instance:CollageGalleryUI;
    public function CollageGalleryUITest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new CollageGalleryUI();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is CollageGalleryUI", instance is CollageGalleryUI);
    }

    public function testIsSprite():void{
        assertTrue("instance is Sprite", instance is Sprite);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
