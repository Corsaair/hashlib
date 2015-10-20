/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Brian Kernighan and Dennis Ritchie hash function.
     * 
     * <p>
     * This function comes from their book "The C Programming Language".
     * It is a simple hash function using a strange set of possible seeds
     * which all constitute a pattern of 31....31...31 etc.,
     * it seems to be very similar to the DJB hash function.
     * </p>
     * 
     * @param bytes
     * @param seed pattern of 31 131 1313 13131 131313 etc.
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public function bkdr( bytes:ByteArray, seed:uint = 131 ):uint
    {
        var hash:uint;
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = uint( hash * seed ) + c;
        }
        
        return hash;
    }

}