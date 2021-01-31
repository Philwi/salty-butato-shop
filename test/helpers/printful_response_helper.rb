module PrintfulResponseHelper

  def printful_products_response
    {
      'code': 200,
      'result': [
        {
          'id': 211743080,
          'external_id': '600463b8f0b402',
          'name': 'Wavegirl Rücken',
          'variants': 43,
          'synced': 43,
          'thumbnail_url': 'https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_preview.png'
        },
        {
          'id': 211548669,
          'external_id': '6001f1151730a5',
          'name': 'Wavegirl klein',
          'variants': 48,
          'synced': 48,
          'thumbnail_url': 'https://files.cdn.printful.com/files/c75/c758703a39a8b70229242ba323b753c0_preview.png'
        },
        {
          'id': 211320981,
          'external_id': '6000ba45244d07',
          'name': 'Wavegirl Sweater ',
          'variants': 30,
          'synced': 30,
          'thumbnail_url': 'https://files.cdn.printful.com/files/fd1/fd1a3173ed1c5319040fa2749225af49_preview.png'
        }
      ]
    }.with_indifferent_access
  end

  def printful_variants_response
    {
      'code': 200,
      'result': {
        'sync_product': {
          'id': 211743080,
          'external_id': '600463b8f0b402',
          'name': 'Wavegirl Rücken',
          'variants': 43,
          'synced': 43,
          'thumbnail_url': 'https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_preview.png'
        },
        'sync_variants': [
          {
            'id': 2402832124,
            'external_id': '600463b8f0b4b4',
            'sync_product_id': 211743080,
            'name': 'Wavegirl Rücken - Black / XS',
            'synced': true,
            'variant_id': 9527,
            'warehouse_product_variant_id': null,
            'retail_price': '26.00',
            'sku': '600463B8EF8A9_Black-XS',
            'currency': 'EUR',
            'product': {
              'variant_id': 9527,
              'product_id': 71,
              'image': 'https://files.cdn.printful.com/products/71/9527_1581408818.jpg',
              'name': 'Bella + Canvas 3001 Unisex Short Sleeve Jersey T-Shirt with Tear Away Label (Black / XS)'
            },
            'files': [
              {
                'id': 272008791,
                'type': 'default',
                'hash': '9955882bfee9b4b6f49a6dd74dffe05f',
                'url': null,
                'filename': 'CC03868E-AB41-48A3-B4F3-936689BEDD1D.png',
                'mime_type': 'image/png',
                'size': 488729,
                'width': 1807,
                'height': 1625,
                'dpi': 300,
                'status': 'ok',
                'created': 1608742807,
                'thumbnail_url': 'https://files.cdn.printful.com/files/995/9955882bfee9b4b6f49a6dd74dffe05f_thumb.png',
                'preview_url': 'https://files.cdn.printful.com/files/995/9955882bfee9b4b6f49a6dd74dffe05f_preview.png',
                'visible': true
              },
              {
                'id': 279481297,
                'type': 'back',
                'hash': 'c3f8ea0a5af35c1823886e3f3905cae9',
                'url': null,
                'filename': '0D753AF0-C8C2-4BC1-A6EC-1497BB5819AD.png',
                'mime_type': 'image/png',
                'size': 6043987,
                'width': 2480,
                'height': 3508,
                'dpi': 300,
                'status': 'ok',
                'created': 1610659873,
                'thumbnail_url': 'https://files.cdn.printful.com/files/c3f/c3f8ea0a5af35c1823886e3f3905cae9_thumb.png',
                'preview_url': 'https://files.cdn.printful.com/files/c3f/c3f8ea0a5af35c1823886e3f3905cae9_preview.png',
                'visible': true
              },
              {
                'id': 280451767,
                'type': 'preview',
                'hash': '85cca12744e1a31aee93d642139f20c9',
                'url': null,
                'filename': 'unisex-premium-t-shirt-black-600463b50192c.jpg',
                'mime_type': 'image/jpeg',
                'size': 98789,
                'width': 1000,
                'height': 1000,
                'dpi': null,
                'status': 'ok',
                'created': 1610900408,
                'thumbnail_url': 'https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_thumb.png',
                'preview_url': 'https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_preview.png',
                'visible': false
              }
            ],
            'options': [
              {
                'id': 'embroidery_type',
                'value': 'flat'
              },
              {
                'id': 'thread_colors',
                'value': []
              },
              {
                'id': 'text_thread_colors',
                'value': []
              },
              {
                'id': 'thread_colors_3d',
                'value': []
              },
              {
                'id': 'thread_colors_chest_left',
                'value': []
              },
              {
                'id': 'text_thread_colors_chest_left',
                'value': []
              },
              {
                'id': 'thread_colors_chest_center',
                'value': []
              },
              {
                'id': 'text_thread_colors_chest_center',
                'value': []
              }
            ]
          },
          {
            'id': 2402832125,
            'external_id': '600463b8f0b505',
            'sync_product_id': 211743080,
            'name': 'Wavegirl Rücken - Black / S',
            'synced': true,
            'variant_id': 4016,
            'warehouse_product_variant_id': null,
            'retail_price': '27.00',
            'sku': '600463B8EF8A9_Black-S',
            'currency': 'EUR',
            'product': {
              'variant_id': 4016,
              'product_id': 71,
              'image': 'https://files.cdn.printful.com/products/71/4016_1581408789.jpg',
              'name': 'Bella + Canvas 3001 Unisex Short Sleeve Jersey T-Shirt with Tear Away Label (Black / S)'
            },
            'files': [
              {
                'id': 272008791,
                'type': 'default',
                'hash': '9955882bfee9b4b6f49a6dd74dffe05f',
                'url': null,
                'filename': 'CC03868E-AB41-48A3-B4F3-936689BEDD1D.png',
                'mime_type': 'image/png',
                'size': 488729,
                'width': 1807,
                'height': 1625,
                'dpi': 300,
                'status': 'ok',
                'created': 1608742807,
                'thumbnail_url': 'https://files.cdn.printful.com/files/995/9955882bfee9b4b6f49a6dd74dffe05f_thumb.png',
                'preview_url': 'https://files.cdn.printful.com/files/995/9955882bfee9b4b6f49a6dd74dffe05f_preview.png',
                'visible': true
              },
              {
                'id': 279481297,
                'type': 'back',
                'hash': 'c3f8ea0a5af35c1823886e3f3905cae9',
                'url': null,
                'filename': '0D753AF0-C8C2-4BC1-A6EC-1497BB5819AD.png',
                'mime_type': 'image/png',
                'size': 6043987,
                'width': 2480,
                'height': 3508,
                'dpi': 300,
                'status': 'ok',
                'created': 1610659873,
                'thumbnail_url': 'https://files.cdn.printful.com/files/c3f/c3f8ea0a5af35c1823886e3f3905cae9_thumb.png',
                'preview_url': 'https://files.cdn.printful.com/files/c3f/c3f8ea0a5af35c1823886e3f3905cae9_preview.png',
                'visible': true
              },
              {
                'id': 280451767,
                'type': 'preview',
                'hash': '85cca12744e1a31aee93d642139f20c9',
                'url': null,
                'filename': 'unisex-premium-t-shirt-black-600463b50192c.jpg',
                'mime_type': 'image/jpeg',
                'size': 98789,
                'width': 1000,
                'height': 1000,
                'dpi': null,
                'status': 'ok',
                'created': 1610900408,
                'thumbnail_url': 'https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_thumb.png',
                'preview_url': 'https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_preview.png',
                'visible': false
              }
            ],
            'options': [
              {
                'id': 'embroidery_type',
                'value': 'flat'
              },
              {
                'id': 'thread_colors',
                'value': []
              },
              {
                'id': 'text_thread_colors',
                'value': []
              },
              {
                'id': 'thread_colors_3d',
                'value': []
              },
              {
                'id': 'thread_colors_chest_left',
                'value': []
              },
              {
                'id': 'text_thread_colors_chest_left',
                'value': []
              },
              {
                'id': 'thread_colors_chest_center',
                'value': []
              },
              {
                'id': 'text_thread_colors_chest_center',
                'value': []
              }
            ]
          }
        ]
      }
    }.with_indifferent_access
  end
end
