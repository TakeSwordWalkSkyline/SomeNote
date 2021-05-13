bool str_isutf8(const char* str,long length){
    int i;

    int nBytes=0;
    unsigned char chr;
    bool bAllAscii= true;
    for(i=0;i<length;i++)
    {
        chr= *(str+i);

        if( (chr&0x80) != 0 )
        {
            bAllAscii= false;
        }

        if(nBytes==0)
        {
            if(chr>=0x80)
            {
                if(chr>=0xFC&&chr<=0xFD)
                {
                    nBytes=6;
                }
                else if(chr>=0xF8)
                {
                    nBytes=5;
                }
                else if(chr>=0xF0)
                {
                    nBytes=4;
                }
                else if(chr>=0xE0)
                {
                    nBytes=3;
                }
                else if(chr>=0xC0)
                {
                    nBytes=2;
                }
                else
                {
                    return false;
                }
                nBytes--;
            }
        }
        else
        {
            if( (chr&0xC0) != 0x80 )
            {
                return false;
            }
            nBytes--;
        }
    }

    if( nBytes > 0 )
    {
        return false;
    }

    if( bAllAscii )
    {
        return true;
    }
    return true;

}

