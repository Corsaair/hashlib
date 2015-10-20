/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Arash Partow hash function.
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     * 
     * @see http://www.partow.net/programming/hashfunctions/index.html General Purpose Hash Function Algorithms
     */
    public function ap( bytes:ByteArray ):uint
    {
        var h:uint = 0xAAAAAAAA;
        
        var i:uint;
        var c:uint;
        var len:uint  = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            
            if( (i & 1) == 0 )
            {
                h ^= uint( uint( h << 7 ) ^ uint(c * uint( h >>> 3 )) );
            }
            else
            {
                h ^= uint( ~( uint( h << 11 ) + uint(c ^ uint( h >>> 5 )) ));
            }
        }
        
        return h;
    }

}