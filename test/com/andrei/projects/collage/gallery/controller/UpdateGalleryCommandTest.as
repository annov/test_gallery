package com.andrei.projects.collage.gallery.controller {
import asunit.framework.TestCase;

import com.andrei.projects.collage.gallery.model.factories.IGalleryFactory;

import com.andrei.projects.collage.gallery.service.IGalleryImageService;

import flash.events.Event;
import flash.events.IEventDispatcher;

import mockolate.nice;
import mockolate.prepare;

import org.robotlegs.mvcs.Command;

public class UpdateGalleryCommandTest extends TestCase {
    protected var instance:UpdateGalleryCommand;
    public function UpdateGalleryCommandTest(methodName:String = null) {
        super(methodName);
    }

    override public function run():void
    {
        var mockolateMaker:IEventDispatcher = prepare(IGalleryFactory);
        mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
    }

    protected function prepareCompleteHandler(e:Event):void
    {
        IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
        super.run();
    }
    override protected function setUp():void
    {
        super.setUp();
        instance = new UpdateGalleryCommand();
        instance.factory = nice(IGalleryFactory);
    }

    override protected function tearDown():void
    {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void
    {
        assertTrue("instance is UpdateGalleryCommand", instance is UpdateGalleryCommand);
    }

    public function testIsCommand():void
    {
        assertTrue("instance is robotlegs Command", instance is Command);
    }

    public function testFailure():void
    {
        assertTrue("Failing test", true);
    }

}
}
