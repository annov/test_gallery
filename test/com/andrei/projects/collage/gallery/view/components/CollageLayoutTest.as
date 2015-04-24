package com.andrei.projects.collage.gallery.view.components {
import asunit.framework.TestCase;

public class CollageLayoutTest extends TestCase {
    protected var instance:CollageLayout;
    public function CollageLayoutTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new CollageLayout();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is CollageLayout", instance is CollageLayout);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
