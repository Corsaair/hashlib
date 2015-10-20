/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * ELF hash function.
     * 
     * <p>
     * Similar to the PJW Hash function, but tweaked for 32-bit processors.
     * Widely used on most UNIX systems.
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public function elf( bytes:ByteArray ):uint
    {
        var hash:uint;
        var x:uint;
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = uint( hash << 4 ) + c;
            x    = uint( hash & 0xF0000000 );
            
            if( x != 0 )
            {
                hash = uint( hash ^ (x >>> 24) );
            }
            
            hash = uint( hash & ~x );
        }
        
        return hash;
    }

}