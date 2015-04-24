package com.andrei.projects.collage.gallery.view.components {
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class TextComponent extends Sprite {
    public function TextComponent() {
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    // Add and format title
    private function addTitle():void {
        var title:TextField = new TextField();
        var titleFormat:TextFormat = new TextFormat();
        titleFormat.size = 24;
        titleFormat.align = TextFormatAlign.CENTER;
        titleFormat.bold = true;
        titleFormat.font = "Arial";
        title.defaultTextFormat = titleFormat;
        title.textColor = 0xFFFFFF;
        title.width = stage.stageWidth;
        title.height = 50;
        title.text = "Collage Gallery (Robotlegs version 1.5.2)";
        addChild(title);
    }

    // Add and format footer text
    private function addFooter():void {
        var footer:TextField = new TextField();
        var footerFormat:TextFormat = new TextFormat();
        footerFormat.size = 16;
        footerFormat.align = TextFormatAlign.RIGHT;
        footerFormat.letterSpacing = 1;
        footerFormat.font = "Arial";
        footer.defaultTextFormat = footerFormat;
        footer.textColor = 0xFFFFFF;
        footer.width = stage.stageWidth - 20;
        footer.height = 20;
        footer.y = stage.stageHeight - footer.height;
        footer.text = "Andrei Novikov";
        addChild(footer);

    }

    private function init(e:Event):void {
        addTitle();
        addFooter();
    }
}
}
