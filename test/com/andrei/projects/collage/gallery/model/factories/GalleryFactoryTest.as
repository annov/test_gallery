/**
 * Created by annov on 24.04.2015.
 */
package com.andrei.projects.collage.gallery.model.factories {
import asunit.framework.TestCase;

public class GalleryFactoryTest extends TestCase {
    protected var instance:GalleryFactory;
    public function GalleryFactoryTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new GalleryFactory();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is GalleryFactory", instance is GalleryFactory);
    }

    public function testIsIGalleryFactory():void{
        assertTrue("instance is IGalleryFactory", instance is IGalleryFactory);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
