/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;

    /**
     * Robert Sedgwicks simple hash function.
     * 
     * <p>
     * From his book "Algorithms in C".
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public function rs( bytes:ByteArray ):uint
    {
        var b:uint    = 0x5C6B7; //378551
        var a:uint    = 0xF8C9; //63689
        var hash:uint = 0;
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = uint( hash *  a ) + c;
            a    = uint( a * b );
        }
        
        return hash;
    }

}