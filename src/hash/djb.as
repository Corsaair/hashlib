/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Professor Daniel J Bernstein hash function.
     * 
     * <p>
     * First shown to the world on the usenet newsgroup comp.lang.c.
     * It is one of the most efficient hash functions ever published.
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public function djb( bytes:ByteArray ):uint
    {
        var hash:uint = 0x1505; //5381
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = ( uint( hash << 5 ) + hash ) + c;
        }
        
        return hash;
    }

}