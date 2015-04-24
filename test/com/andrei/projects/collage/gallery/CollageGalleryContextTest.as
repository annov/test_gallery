package com.andrei.projects.collage.gallery {
import com.andrei.projects.collage.gallery.*;

import asunit.framework.TestCase;

import flash.display.Sprite;

import org.robotlegs.mvcs.SignalContext;

public class CollageGalleryContextTest extends TestCase{
    protected var instance:CollageGalleryContext;
    public function CollageGalleryContextTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new CollageGalleryContext(new Sprite());
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is CollageGalleryContext", instance is CollageGalleryContext);
    }

    public function testIsContext():void{
        assertTrue("instance is robotlegs SignalContext", instance is SignalContext);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
