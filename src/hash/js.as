/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;

    /**
     * Justin Sobel bitwise hash function.
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */ 
    public function js( bytes:ByteArray ):uint
    {
        var hash:uint = 0x4E67C6A7; //1315423911
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c     = uint( bytes[ i ] );
            hash ^= uint( ( hash << 5 ) + c + ( hash >>> 2 ));
        }
        
        return hash;
    }

}