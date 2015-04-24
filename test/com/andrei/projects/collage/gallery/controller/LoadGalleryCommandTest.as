package com.andrei.projects.collage.gallery.controller {
import asunit.framework.TestCase;

import com.andrei.projects.collage.gallery.service.IGalleryImageService;

import flash.events.Event;
import flash.events.IEventDispatcher;

import mockolate.nice;
import mockolate.prepare;
import mockolate.verify;

import org.robotlegs.mvcs.Command;

public class LoadGalleryCommandTest extends TestCase {
    protected var instance:LoadGalleryCommand;
    public function LoadGalleryCommandTest(methodName:String = null) {
        super(methodName);
    }

    override public function run():void
    {
        var mockolateMaker:IEventDispatcher = prepare(IGalleryImageService);
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
        instance = new LoadGalleryCommand();
        instance.service = nice(IGalleryImageService);
    }

    override protected function tearDown():void
    {
        super.tearDown();
        instance = null;
    }

    public function testInstantiated():void
    {
        assertTrue("instance is LoadGalleryCommand", instance is LoadGalleryCommand);
    }

    public function testIsCommand():void
    {
        assertTrue("instance is robotlegs Command", instance is Command);
    }

    public function testFailure():void
    {
        assertTrue("Failing test", true);
    }

    public function testExecute():void
    {
        instance.execute();
        verify(instance.service).method("loadGallery");
    }

}
}
