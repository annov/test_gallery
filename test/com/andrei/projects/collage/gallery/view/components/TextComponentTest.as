/**
 * Created by annov on 24.04.2015.
 */
package com.andrei.projects.collage.gallery.view.components {
import asunit.framework.TestCase;

import flash.display.Sprite;

public class TextComponentTest extends TestCase {
    protected var instance:TextComponent;
    public function TextComponentTest(methodName:String=null) {
        super(methodName);
    }
    override protected function setUp():void {
        super.setUp();
        instance = new TextComponent();
    }

    override protected function tearDown():void {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void {
        assertTrue("instance is TextComponent", instance is TextComponent);
    }

    public function testIsSprite():void{
        assertTrue("instance is Sprite", instance is Sprite);
    }

    public function testFailure():void {
        assertTrue("Failing test", true);
    }
}
}
