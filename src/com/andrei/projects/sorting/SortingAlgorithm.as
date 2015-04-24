package com.andrei.projects.sorting {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;

[SWF(width="800", height="600")]
public class SortingAlgorithm extends Sprite {
    private var _textField:TextField;
    private var _initText:String;
    private var _updateTimer:Timer;
    private var _fstArray:Array;
    private var _sndArray:Array;
    private var _resultArray:Array;

    private const MIN_VALUE:int = 30;
    private const MAX_VALUE:int = 40;
    private const DELAY:int = 500;

    public function SortingAlgorithm() {
        textField = new TextField();
        textField.width = stage.stageWidth;
        textField.height = stage.stageHeight;
        addChild(textField);

        updateTimer = new Timer(DELAY, 1);
        updateTimer.addEventListener(TimerEvent.TIMER, nextStep);

        if (stage) init();
        else addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        runAlgorithm();
    }

    private function runAlgorithm():void {
        fstArray = generateSortedArray();
        sndArray = generateSortedArray();
        resultArray = new Array();

        initText = "SORTING ALGORITHM\n\nInit arrays:\n" + fstArray + "\n" + sndArray + "\n\n";

        setText(fstArray, sndArray, resultArray);
        updateTimer.start();
    }
    private function nextStep(event:TimerEvent):void {
        var fstArrayNumber:int = fstArray.shift();
        var sndArrayNumber:int = sndArray.shift();

        if (fstArrayNumber < sndArrayNumber) {
            resultArray.push(fstArrayNumber);
            sndArray.unshift(sndArrayNumber);
        } else if (fstArrayNumber > sndArrayNumber) {
            resultArray.push(sndArrayNumber);
            fstArray.unshift(fstArrayNumber)
        } else {
            resultArray.push(fstArrayNumber);
            resultArray.push(sndArrayNumber);
        }
        if (fstArray.length < 1) {
            resultArray = resultArray.concat(sndArray);
            sndArray = [];
        }
        if (sndArray.length < 1) {
            resultArray = resultArray.concat(fstArray);
            fstArray = [];
        }
        if (fstArray.length < 1 && sndArray.length < 1) {
            updateTimer.stop();
        } else {
            updateTimer.reset();
            updateTimer.start();
        }
        setText(fstArray, sndArray, resultArray);
    }
    private function setText(fst:Array, snd:Array, result:Array):void {
        var postText:String = fst.length < 1 && snd.length < 1 ? "\n\nDONE!" : "";
        var middleText:String = "First array: " + fst + "\nSecond array: " + snd + "\nResult: " + result;
        textField.text = initText + middleText + postText;
    }
    private function generateSortedArray():Array {
        var number:int = 1;
        var arrayLength:int = randomArrayLength();
        var sortedArray:Array = new Array();
        while (sortedArray.length < arrayLength) {
            if (randomBoolean()) {
                number++;
            }
            if (randomBoolean()) {
                sortedArray.push(number);
            }
        }
        return sortedArray;
    }
    private function randomArrayLength():int {
        return Math.round(Math.random() * (MAX_VALUE - MIN_VALUE) + MIN_VALUE);
    }
    private function randomBoolean():Boolean
    {
        return Boolean( Math.round(Math.random()) );
    }

    public function get textField():TextField {
        return _textField;
    }

    public function set textField(value:TextField):void {
        _textField = value;
    }

    public function get updateTimer():Timer {
        return _updateTimer;
    }

    public function set updateTimer(value:Timer):void {
        _updateTimer = value;
    }

    public function get fstArray():Array {
        return _fstArray;
    }

    public function set fstArray(value:Array):void {
        _fstArray = value;
    }

    public function get sndArray():Array {
        return _sndArray;
    }

    public function set sndArray(value:Array):void {
        _sndArray = value;
    }

    public function get resultArray():Array {
        return _resultArray;
    }

    public function set resultArray(value:Array):void {
        _resultArray = value;
    }

    public function get initText():String {
        return _initText;
    }

    public function set initText(value:String):void {
        _initText = value;
    }
}
}
