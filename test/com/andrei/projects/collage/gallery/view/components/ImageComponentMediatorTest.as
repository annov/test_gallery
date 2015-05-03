package com.andrei.projects.collage.gallery.view.components {
import asunit.framework.TestCase;

import org.robotlegs.mvcs.Mediator;

public class ImageComponentMediatorTest extends TestCase {
    protected var instance:ImageComponentMediator;
    public function ImageComponentMediatorTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new ImageComponentMediator();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is ImageComponentMediator", instance is ImageComponentMediator);
    }

    public function testIsMediator():void{
        assertTrue("instance is Mediator", instance is Mediator);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
