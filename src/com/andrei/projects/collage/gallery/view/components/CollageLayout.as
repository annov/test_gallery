package com.andrei.projects.collage.gallery.view.components {
import com.andrei.projects.collage.gallery.model.vo.IGalleryImage;
import com.greensock.loading.display.ContentDisplay;

import flash.geom.Matrix;

public class CollageLayout {
    public function CollageLayout() {

    }
    // Gallery width
    private var _width:Number;

    public function get width():Number {
        return _width;
    }

    public function set width(value:Number):void {
        _width = value;
    }

    // Update images layout
    // Used FCNR algorithm - Floor Ñeiling No Rotation
    public function update(images:Vector.<IGalleryImage>):void {
        var x:Number = 0;
        var y:Number = 0;
        var image:ContentDisplay;
        var maxHeight:Number = 0;
        var indexes:Vector.<Number> = new Vector.<Number>();
        var heights:Vector.<Number> = new Vector.<Number>();

        // Sort images by height
        for (var i:int = 0; i < images.length; i++) {
            image = images[i].content;
            indexes.push(i);
            heights.push(image.height);
        }
        indexes = sortIndexes(heights, indexes);

        var currentLevel:Number;
        var isPacked:Boolean;
        var isFloor:Boolean;
        var packed:Vector.<Vector.<Vector.<Matrix>>> = new Vector.<Vector.<Vector.<Matrix>>>();
        var levelPart:Vector.<Matrix>;
        var fstElementMatrix:Matrix;
        var lastElementMatrix:Matrix;

        for (i = 0; i < images.length; i++) {
            image = images[indexes[i]].content;

            currentLevel = 0;
            isPacked = false;
            while (!isPacked) {
                x = 0;
                y = currentLevel == 0 ? 0 : packed[currentLevel - 1][0][0].d;
                isFloor = false;
                if (packed.length <= currentLevel) {
                    // Current level is empty
                    packed.push(new Vector.<Vector.<Matrix>>());
                    packed[currentLevel].push(new Vector.<Matrix>());
                    isPacked = true;
                } else {
                    levelPart = packed[currentLevel][0];
                    lastElementMatrix = levelPart[levelPart.length - 1];
                    x = lastElementMatrix.c;
                    if (x + image.width > width) {
                        // Ceiling is full. Go to floor
                        isFloor = true;
                        fstElementMatrix = levelPart[0];
                        x = width - image.width;
                        y = fstElementMatrix.d - fstElementMatrix.b - image.height;
                        if (packed[currentLevel].length < 2) {
                            if (checkLevel(new Matrix(x, y, x + image.width, y + image.height), packed[currentLevel])) {
                                // Ceiling is empty
                                packed[currentLevel].push(new Vector.<Matrix>());
                                isPacked = true;
                            }
                        } else {
                            levelPart = packed[currentLevel][1];
                            lastElementMatrix = levelPart[levelPart.length - 1];
                            x = lastElementMatrix.a - image.width;
                            if (x >= 0) {
                                // Check place
                                isPacked = checkLevel(new Matrix(x, y, x + image.width, y + image.height), packed[currentLevel]);
                            }
                        }
                    } else {
                        isPacked = true;
                    }
                }
                // Current level is full. Go to next level
                if (!isPacked) {
                    currentLevel++;
                }
            }

            // New Matrix(x1, y1, x2, y2) (x1, y1) - image top-left point, (x2, y2) - image bottom-right point
            packed[currentLevel][isFloor ? 1 : 0].push(new Matrix(x, y, x + image.width, y + image.height));
            maxHeight = Math.max(maxHeight, y + image.height);
            // Set image position
            images[indexes[i]].x = x;
            images[indexes[i]].y = y;
        }
    }

    // Check place
    private function checkLevel(element:Matrix, level:Vector.<Vector.<Matrix>>):Boolean {
        var verCheck:Boolean, horCheck1:Boolean, horCheck2:Boolean;
        for each (var levelPart:Vector.<Matrix>in level) {
            for each (var packedElement:Matrix in levelPart) {
                verCheck = packedElement.d > element.b;
                horCheck1 = packedElement.a < element.a && packedElement.c > element.a;
                horCheck2 = packedElement.a < element.c && packedElement.c > element.c;
                if (verCheck && (horCheck1 || horCheck2)) {
                    return false;
                }
            }
        }
        return true;
    }
    // Sort indexes by image height (increase)
    // Used shell sort
    private function sortIndexes(data:Vector.<Number>, indexes:Vector.<Number>):Vector.<Number> {
        var n:int = data.length;
        var inc:int = int(n / 2 + 0.5);

        while (inc) {
            for (var i:int = inc; i < n; i++) {
                var temp:Number = data[i], tempInd:Number = indexes[i], j:int = i;
                while (j >= inc && data[int(j - inc)] > temp) {
                    data[j] = data[int(j - inc)];
                    indexes[j] = indexes[int(j - inc)];
                    j = int(j - inc);
                }
                data[j] = temp;
                indexes[j] = tempInd;
            }
            inc = int(inc / 2.2 + 0.5);
        }
        return indexes.reverse();
    }
}
}
