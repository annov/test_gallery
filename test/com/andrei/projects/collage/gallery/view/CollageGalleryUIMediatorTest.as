package com.andrei.projects.collage.gallery.view {
import asunit.framework.TestCase;

import org.robotlegs.mvcs.Mediator;

public class CollageGalleryUIMediatorTest extends TestCase {
    protected var instance:CollageGalleryUIMediator;
    public function CollageGalleryUIMediatorTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new CollageGalleryUIMediator();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is CollageGalleryUIMediator", instance is CollageGalleryUIMediator);
    }

    public function testIsMediator():void{
        assertTrue("instance is Mediator", instance is Mediator);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
