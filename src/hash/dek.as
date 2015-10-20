/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Donald E Knuth hash function.
     * 
     * <p>
     * Algorithm proposed in "The Art Of Computer Porgramming Volume 3"
     * under the topic of sorting and search chapter 6.4.
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public function dek( bytes:ByteArray ):uint
    {
        var i:uint;
        var c:uint;
        var len:uint  = bytes.length;
        var hash:uint = len;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = ( uint( hash << 5 ) ^ uint( hash >>> 27 ) ) ^ c;
        }
        
        return hash;
    }

}