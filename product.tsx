"use client";

import { useState, use, useEffect, useRef, JSX } from "react";
import { useRouter } from "next/navigation";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import {
  ArrowLeft, Save, Upload, X, Info, Search, Image, Package,
  Tag, BarChart3, Globe, Settings, Truck, Gift, Calendar,
  Users, DollarSign, Shield, FileText, Link as LinkIcon, ShoppingCart, Video, Layers
} from "lucide-react";
import Link from "next/link";
import { apiClient } from "@/lib/api";
import { ProductDescriptionEditor } from "@/app/admin/products/SelfHostedEditor";
import { useToast } from "@/components/CustomToast";
import { API_BASE_URL } from "@/lib/api-config";

// Interfaces
interface BrandData {
  id: string;
  name: string;
  description?: string;
  slug?: string;
  logoUrl?: string;
  isPublished?: boolean;
  showOnHomepage?: boolean;
  displayOrder?: number;
}

interface CategoryData {
  id: string;
  name: string;
  description?: string;
  slug?: string;
  imageUrl?: string;
  isActive?: boolean;
  sortOrder?: number;
  parentCategoryId?: string | null;
  parentCategoryName?: string | null;
  subCategories?: CategoryData[];
}

interface BrandApiResponse {
  success: boolean;
  message: string;
  data: BrandData[];
  errors: null;
}

interface CategoryApiResponse {
  success: boolean;
  message: string;
  data: CategoryData[];
  errors: null;
}

interface ProductApiImage {
  id: string;
  imageUrl: string;
  altText: string;
  sortOrder: number;
  isMain: boolean;
}

interface ProductImage {
  id: string;
  imageUrl: string;
  altText: string;
  sortOrder: number;
  isMain: boolean;
  fileName?: string;
  fileSize?: number;
  file?: File;
}

interface ProductItem {
  id: string;
  name: string;
  sku: string;
  price: number;
  oldPrice?: number;
  description?: string;
  shortDescription?: string;
}

interface ProductsApiResponse {
  success: boolean;
  message: string;
  data: {
    items: ProductItem[];
    totalCount: number;
    page: number;
    pageSize: number;
    totalPages: number;
    hasPrevious: boolean;
    hasNext: boolean;
  };
  errors: null;
}

interface DropdownsData {
  brands: BrandData[];
  categories: CategoryData[];
}

interface ProductVariant {
  id: string;
  sku: string;
  price: number;
  stockQuantity: number;
  attributeCombination: Record<string, string>; // e.g., { "Size": "M", "Color": "Red" }
  isEnabled: boolean;
}

export default function EditProductPage({ params }: { params: Promise<{ id: string }> }) {
  const router = useRouter();
  const toast = useToast();
  const { id: productId } = use(params);
  
  const [searchTerm, setSearchTerm] = useState('');
  const [searchTermCross, setSearchTermCross] = useState('');
  const [attributes, setAttributes] = useState<Array<{id: string, name: string, values: string[]}>>([]);
  const [productVariants, setProductVariants] = useState<ProductVariant[]>([]);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [isDeletingImage, setIsDeletingImage] = useState(false);
  const [uploadingImages, setUploadingImages] = useState(false);
  const [dropdownsData, setDropdownsData] = useState<DropdownsData>({
    brands: [],
    categories: [],
  });
  const [availableProducts, setAvailableProducts] = useState<Array<{id: string, name: string, sku: string, price: string}>>([]);

  const [formData, setFormData] = useState({
    // Basic Info
    name: '',
    shortDescription: '',
    fullDescription: '',
    sku: '',
    brand: '',
    categories: '',
    manufacturerId: '',
    published: true,
    productType: 'simple',
    visibleIndividually: true,
    customerRoles: 'all',
    limitedToStores: false,
    vendorId: '',
    requireOtherProducts: false,
    requiredProductIds: '',
    automaticallyAddProducts: false,
    showOnHomepage: false,
    displayOrder: '1',
    productTags: '',
    gtin: '',
    manufacturerPartNumber: '',
    adminComment: '',
    allowCustomerReviews: false,
    
    // Related Products
    relatedProducts: [] as string[],
    crossSellProducts: [] as string[],
    productImages: [] as ProductImage[],
    videoUrls: [] as string[],
    specifications: [] as Array<{id: string, name: string, value: string, displayOrder: number}>,

    // Pricing
    price: '',
    oldPrice: '',
    cost: '',
    disableBuyButton: false,
    disableWishlistButton: false,
    allowBackorder: false,
    callForPrice: false,
    customerEntersPrice: false,
    minimumCustomerEnteredPrice: '',
    maximumCustomerEnteredPrice: '',
    basepriceEnabled: false,
    basepriceAmount: '',
    basepriceUnit: '',
    basepriceBaseAmount: '',
    basepriceBaseUnit: '',
    markAsNew: false,
    markAsNewStartDate: '',
    markAsNewEndDate: '',
    categoryName: '',
    
    // Discounts
    hasDiscountsApplied: false,
    availableStartDate: '',
    availableEndDate: '',

    // Tax
    taxExempt: false,
    taxCategoryId: '',
    telecommunicationsBroadcastingElectronicServices: false,

    // SEO
    metaTitle: '',
    metaKeywords: '',
    metaDescription: '',
    searchEngineFriendlyPageName: '',

    // Inventory
    manageInventory: 'track',
    stockQuantity: '',
    displayStockAvailability: true,
    displayStockQuantity: false,
    minStockQuantity: '',
    lowStockActivity: 'nothing',
    notifyAdminForQuantityBelow: '',
    backorders: 'no-backorders',
    allowBackInStockSubscriptions: false,
    productAvailabilityRange: '',
    minCartQuantity: '1',
    maxCartQuantity: '10000',
    allowedQuantities: '',
    allowAddingOnlyExistingAttributeCombinations: false,
    notReturnable: false,

    // Shipping
    isShipEnabled: true,
    isFreeShipping: false,
    shipSeparately: false,
    additionalShippingCharge: '',
    deliveryDateId: '',
    weight: '',
    length: '',
    width: '',
    height: '',

    // Gift Cards
    isGiftCard: false,
    giftCardType: 'virtual',
    overriddenGiftCardAmount: '',

    // Downloadable Product
    isDownload: false,
    downloadId: '',
    unlimitedDownloads: true,
    maxNumberOfDownloads: '',
    downloadExpirationDays: '',
    downloadActivationType: 'when-order-is-paid',
    hasUserAgreement: false,
    userAgreementText: '',
    hasSampleDownload: false,
    sampleDownloadId: '',

    // Recurring Product
    isRecurring: false,
    recurringCycleLength: '',
    recurringCyclePeriod: 'days',
    recurringTotalCycles: '',

    // Rental Product
    isRental: false,
    rentalPriceLength: '',
    rentalPricePeriod: 'days',
  });

  // Clean renderCategoryOptions
  const renderCategoryOptions = (categories: CategoryData[]): JSX.Element[] => {
    const options: JSX.Element[] = [];
    
    categories.forEach((category) => {
      options.push(
        <option 
          key={category.id} 
          value={category.id}
          data-category-name={category.name}
          data-display-name={category.name}
          className="font-semibold bg-slate-700 text-violet-300"
          style={{ 
            fontWeight: 'bold',
            backgroundColor: '#374151',
            color: '#c4b5fd',
            paddingLeft: '8px'
          }}
        >
          {category.name}
        </option>
      );
      
      if (category.subCategories && category.subCategories.length > 0) {
        category.subCategories.forEach((subCategory) => {
          const hierarchicalName = `${category.name} >> ${subCategory.name}`;
          options.push(
            <option 
              key={subCategory.id} 
              value={subCategory.id}
              data-category-name={hierarchicalName}
              data-parent-name={category.name}
              data-sub-name={subCategory.name}
              data-display-name={hierarchicalName}
              className="bg-slate-600 text-slate-300"
              style={{ 
                backgroundColor: '#4b5563',
                color: '#d1d5db',
                paddingLeft: '24px',
                fontStyle: 'italic'
              }}
            >
              {hierarchicalName}
            </option>
          );
        });
      }
    });
    
    return options;
  };

  // Fetch all data
  useEffect(() => {
    const fetchAllData = async () => {
      try {
        console.log('🔄 Fetching all data...');

        const [
          brandsResponse,
          categoriesResponse,
          productsResponse,
          productResponse
        ] = await Promise.all([
          apiClient.get<BrandApiResponse>('/api/Brands?includeUnpublished=false'),
          apiClient.get<CategoryApiResponse>('/api/Categories?includeInactive=true&includeSubCategories=true'),
          apiClient.get<ProductsApiResponse>('/api/Products'),
          apiClient.get(`/api/Products/${productId}`)
        ]);

        const brandsData = (brandsResponse.data as BrandApiResponse)?.data || [];
        const categoriesData = (categoriesResponse.data as CategoryApiResponse)?.data || [];

        setDropdownsData({
          brands: brandsData,
          categories: categoriesData,
        });

        if (productsResponse.data && !productsResponse.error) {
          const apiResponse = productsResponse.data as ProductsApiResponse;

          if (apiResponse.success && apiResponse.data.items) {
            const transformedProducts = apiResponse.data.items.map(product => ({
              id: product.id,
              name: product.name,
              sku: product.sku,
              price: `₹${product.price.toFixed(2)}`
            }));

            setAvailableProducts(transformedProducts);
          }
        }

        if (productResponse.data && !productResponse.error) {
          const productApiResponse = productResponse.data as any;

          if (productApiResponse.success && productApiResponse.data) {
            const product = productApiResponse.data;

            const getCategoryDisplayName = (categoryId: string, categories: CategoryData[]): string => {
              if (!categoryId) return '';

              for (const cat of categories) {
                if (cat.id === categoryId) {
                  return cat.name;
                }
                if (cat.subCategories) {
                  for (const sub of cat.subCategories) {
                    if (sub.id === categoryId) {
                      return `${cat.name} >> ${sub.name}`;
                    }
                  }
                }
              }
              return '';
            };

            const formatDateTimeForInput = (dateString: string | null | undefined): string => {
              if (!dateString) return '';
              try {
                const date = new Date(dateString);
                if (isNaN(date.getTime())) return '';
                const year = date.getFullYear();
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const day = String(date.getDate()).padStart(2, '0');
                const hours = String(date.getHours()).padStart(2, '0');
                const minutes = String(date.getMinutes()).padStart(2, '0');
                return `${year}-${month}-${day}T${hours}:${minutes}`;
              } catch {
                return '';
              }
            };

            const parseSpecificationString = (specStr: string | null): Array<{id: string, name: string, value: string, displayOrder: number}> => {
              if (!specStr) return [];
              try {
                const parsed = JSON.parse(specStr);
                return Array.isArray(parsed) ? parsed : [];
              } catch {
                return [];
              }
            };

            const categoryDisplayName = getCategoryDisplayName(product.categoryId || '', categoriesData);

            setFormData(prevData => ({
              ...prevData,

              // Basic Info
              name: product.name || '',
              shortDescription: product.shortDescription || '',
              fullDescription: product.description || '',
              sku: product.sku || '',
              brand: product.brandId || '',
              categories: product.categoryId || '',
              categoryName: categoryDisplayName,
              manufacturerId: product.manufacturerId || '',
              published: product.isPublished ?? true,
              productType: product.productType || 'simple',
              visibleIndividually: product.visibleIndividually ?? true,
              showOnHomepage: product.showOnHomepage ?? false,
              displayOrder: product.displayOrder?.toString() || '1',
              productTags: product.tags || '',
              gtin: product.gtin || '',
              manufacturerPartNumber: product.manufacturerPartNumber || '',
              adminComment: product.adminComment || '',
              deliveryDateId: product.deliveryDateId || '',
              allowCustomerReviews: product.allowCustomerReviews ?? false,

              // Pricing
              price: product.price?.toString() || '',
              oldPrice: product.oldPrice?.toString() || product.compareAtPrice?.toString() || '',
              cost: product.costPrice?.toString() || '',
              disableBuyButton: product.disableBuyButton ?? false,
              disableWishlistButton: product.disableWishlistButton ?? false,
              callForPrice: product.callForPrice ?? false,
              customerEntersPrice: product.customerEntersPrice ?? false,
              minimumCustomerEnteredPrice: product.minimumCustomerEnteredPrice?.toString() || '',
              maximumCustomerEnteredPrice: product.maximumCustomerEnteredPrice?.toString() || '',

              // Mark as New
              markAsNew: !!(product.markAsNewStartDate || product.markAsNewEndDate),
              markAsNewStartDate: formatDateTimeForInput(product.markAsNewStartDate),
              markAsNewEndDate: formatDateTimeForInput(product.markAsNewEndDate),
              availableStartDate: formatDateTimeForInput(product.availableStartDate),
              availableEndDate: formatDateTimeForInput(product.availableEndDate),

              // Tax
              taxExempt: product.taxExempt ?? false,
              taxCategoryId: product.taxCategoryId || '',

              // SEO
              metaTitle: product.metaTitle || '',
              metaKeywords: product.metaKeywords || '',
              metaDescription: product.metaDescription || '',
              searchEngineFriendlyPageName: product.searchEngineFriendlyPageName || '',

              // Inventory
              stockQuantity: product.stockQuantity?.toString() || '0',
              manageInventory: product.trackQuantity ? 'track' : 'dont-track',
              minStockQuantity: product.minStockQuantity?.toString() || '0',
              notifyAdminForQuantityBelow: product.notifyQuantityBelow?.toString() || '1',
              allowBackorder: product.allowBackorder ?? false,
              allowBackInStockSubscriptions: product.allowBackorder ?? false,
              backorders: product.backorderMode || 'no-backorders',
              minCartQuantity: product.orderMinimumQuantity?.toString() || '1',
              maxCartQuantity: product.orderMaximumQuantity?.toString() || '10000',
              allowedQuantities: product.allowedQuantities || '',
              notReturnable: product.notReturnable ?? false,

              // Shipping
              isShipEnabled: product.requiresShipping ?? true,
              isFreeShipping: product.isFreeShipping ?? false,
              shipSeparately: product.shipSeparately ?? false,
              additionalShippingCharge: product.additionalShippingCharge?.toString() || '',
              weight: product.weight?.toString() || '',
              length: product.length?.toString() || '',
              width: product.width?.toString() || '',
              height: product.height?.toString() || '',

              // Related Products
              relatedProducts: typeof product.relatedProductIds === 'string'
                ? product.relatedProductIds.split(',').filter((id: string) => id.trim())
                : Array.isArray(product.relatedProductIds)
                ? product.relatedProductIds
                : [],

              crossSellProducts: typeof product.crossSellProductIds === 'string'
                ? product.crossSellProductIds.split(',').filter((id: string) => id.trim())
                : Array.isArray(product.crossSellProductIds)
                ? product.crossSellProductIds
                : [],

              // Video URLs
              videoUrls: typeof product.videoUrls === 'string'
                ? product.videoUrls.split(',').filter((url: string) => url.trim())
                : Array.isArray(product.videoUrls)
                ? product.videoUrls
                : [],

              // Product Images
              productImages: product.images?.map((img: any) => ({
                id: img.id || Date.now().toString(),
                imageUrl: img.imageUrl || '',
                altText: img.altText || '',
                sortOrder: img.sortOrder || 1,
                isMain: img.isMain || false,
                fileName: img.imageUrl ? img.imageUrl.split('/').pop() : undefined,
                fileSize: undefined,
                file: undefined
              })) || [],

              // Specifications
              specifications: parseSpecificationString(product.specificationAttributes)
            }));

            if (product.attributes && Array.isArray(product.attributes)) {
              setAttributes(
                product.attributes.map((attr: any) => ({
                  id: attr.id || Date.now().toString(),
                  name: attr.name || '',
                  values: Array.isArray(attr.values) ? attr.values : 
                          typeof attr.values === 'string' ? attr.values.split(',').map((v: string) => v.trim()) : 
                          ['']
                }))
              );
            } else {
              setAttributes([]);
            }

            // Load product variants if exists
            if (product.variants && Array.isArray(product.variants)) {
              setProductVariants(product.variants);
            }
          }
        }
      } catch (error) {
        console.error('❌ Error fetching data:', error);
        toast.error('Failed to load product data');
      }
    };

    if (productId) {
      fetchAllData();
    }
  }, [productId]);

  const handleSubmit = async (e: React.FormEvent, isDraft: boolean = false) => {
    e.preventDefault();

    const target = e.target as HTMLElement;
    if (target.hasAttribute('data-submitting')) {
      toast.info('⏳ Already submitting... Please wait!');
      return;
    }
    target.setAttribute('data-submitting', 'true');

    try {
      if (!formData.name || !formData.sku) {
        toast.error('⚠️ Please fill in required fields: Product Name and SKU');
        return;
      }

      const guidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

      let categoryId: string | null = null;
      if (formData.categories && formData.categories.trim()) {
        const trimmedCategory = formData.categories.trim();
        if (guidRegex.test(trimmedCategory)) {
          categoryId = trimmedCategory;
        }
      }

      const formattedAttributes = attributes
        .filter(attr => attr.name && attr.name.trim())
        .map(attr => {
          const filteredValues = attr.values
            .filter(value => value && value.trim())
            .map(value => value.trim());
          
          return {
            id: attr.id,
            name: attr.name.trim(),
            values: filteredValues
          };
        })
        .filter(attr => attr.values.length > 0);

      let brandId: string | null = null;
      if (formData.brand && formData.brand.trim()) {
        const trimmedBrand = formData.brand.trim();
        if (guidRegex.test(trimmedBrand)) {
          brandId = trimmedBrand;
        }
      }

      let manufacturerId: string | null = null;
      if (formData.manufacturerId && formData.manufacturerId.trim()) {
        const trimmedManufacturer = formData.manufacturerId.trim();
        if (guidRegex.test(trimmedManufacturer)) {
          manufacturerId = trimmedManufacturer;
        }
      }

      const productData = {
        id: productId,
        
        // Basic Info
        name: formData.name.trim(),
        description: formData.fullDescription || formData.shortDescription || formData.name || 'Product description',
        shortDescription: formData.shortDescription?.trim() || '',
        sku: formData.sku.trim(),
        gtin: formData.gtin?.trim() || null,
        manufacturerPartNumber: formData.manufacturerPartNumber?.trim() || null,
        displayOrder: parseInt(formData.displayOrder) || 1,
        adminComment: formData.adminComment?.trim() || null,

        // Pricing
        price: parseFloat(formData.price) || 0,
        oldPrice: formData.oldPrice ? parseFloat(formData.oldPrice) : null,
        compareAtPrice: formData.oldPrice ? parseFloat(formData.oldPrice) : null,
        costPrice: formData.cost ? parseFloat(formData.cost) : null,
        disableBuyButton: formData.disableBuyButton,
        disableWishlistButton: formData.disableWishlistButton,
        callForPrice: formData.callForPrice,
        customerEntersPrice: formData.customerEntersPrice,
        minimumCustomerEnteredPrice: formData.customerEntersPrice && formData.minimumCustomerEnteredPrice 
          ? parseFloat(formData.minimumCustomerEnteredPrice) 
          : null,
        maximumCustomerEnteredPrice: formData.customerEntersPrice && formData.maximumCustomerEnteredPrice 
          ? parseFloat(formData.maximumCustomerEnteredPrice) 
          : null,

        // Attributes
        attributes: formattedAttributes,

        // Variants
        ...(formData.productType === 'grouped' && productVariants.length > 0 && { variants: productVariants }),

        // Dimensions
        weight: parseFloat(formData.weight) || 0,
        length: formData.length ? parseFloat(formData.length) : null,
        width: formData.width ? parseFloat(formData.width) : null,
        height: formData.height ? parseFloat(formData.height) : null,

        // Shipping
        requiresShipping: formData.isShipEnabled,
        isFreeShipping: formData.isFreeShipping,
        shipSeparately: formData.shipSeparately,
        additionalShippingCharge: formData.additionalShippingCharge 
          ? parseFloat(formData.additionalShippingCharge) 
          : null,
        deliveryDateId: formData.deliveryDateId || null,

        // Inventory
        stockQuantity: parseInt(formData.stockQuantity) || 0,
        trackQuantity: formData.manageInventory === 'track',
        minStockQuantity: parseInt(formData.minStockQuantity) || 0,
        notifyAdminForQuantityBelow: true,
        notifyQuantityBelow: parseInt(formData.notifyAdminForQuantityBelow) || 1,
        allowBackorder: formData.allowBackorder,
        backorderMode: formData.backorders || 'no-backorders',
        orderMinimumQuantity: parseInt(formData.minCartQuantity) || 1,
        orderMaximumQuantity: parseInt(formData.maxCartQuantity) || 10000,
        allowedQuantities: formData.allowedQuantities?.trim() || null,
        notReturnable: formData.notReturnable,

        // Categories & Brand
        ...(categoryId && { categoryId }),
        ...(brandId && { brandId }),
        ...(manufacturerId && { manufacturerId }),

        // Mark as New
        markAsNew: formData.markAsNew,
        availableStartDate: formData.availableStartDate && formData.availableStartDate.trim()
          ? new Date(formData.availableStartDate).toISOString() 
          : null,
        availableEndDate: formData.availableEndDate && formData.availableEndDate.trim()
          ? new Date(formData.availableEndDate).toISOString() 
          : null,
        markAsNewStartDate: formData.markAsNew && formData.markAsNewStartDate 
          ? new Date(formData.markAsNewStartDate).toISOString() 
          : null,
        markAsNewEndDate: formData.markAsNew && formData.markAsNewEndDate 
          ? new Date(formData.markAsNewEndDate).toISOString() 
          : null,

        // Specifications
        specificationAttributes: formData.specifications.length > 0 
          ? JSON.stringify(formData.specifications) 
          : null,

        // Publishing
        isPublished: isDraft ? false : formData.published,
        status: isDraft ? 1 : (formData.published ? 2 : 1),
        visibleIndividually: formData.visibleIndividually,
        showOnHomepage: formData.showOnHomepage || false,
        allowCustomerReviews: formData.allowCustomerReviews,

        // Tax
        taxExempt: formData.taxExempt,
        taxCategoryId: formData.taxCategoryId || null,

        // SEO
        metaTitle: formData.metaTitle?.trim() || null,
        metaDescription: formData.metaDescription?.trim() || null,
        metaKeywords: formData.metaKeywords?.trim() || null,
        searchEngineFriendlyPageName: formData.searchEngineFriendlyPageName?.trim() || null,

        // Related Products
        tags: formData.productTags?.trim() || null,
        relatedProductIds: Array.isArray(formData.relatedProducts) && formData.relatedProducts.length > 0 
          ? formData.relatedProducts.join(',') 
          : null,
        crossSellProductIds: Array.isArray(formData.crossSellProducts) && formData.crossSellProducts.length > 0 
          ? formData.crossSellProducts.join(',') 
          : null,

        // Videos
        videoUrls: formData.videoUrls && formData.videoUrls.length > 0 
          ? formData.videoUrls.join(',') 
          : null,
      };

      console.log('📦 Sending product data:', productData);

      const response = await apiClient.put(`/api/Products/${productId}`, productData);

      if (response?.data) {
        const message = isDraft 
          ? '💾 Product saved as draft successfully!' 
          : '✅ Product updated successfully!';

        toast.success(message);

        setTimeout(() => {
          router.push('/admin/products');
        }, 800);
      } else if (response?.error) {
        throw new Error(response.error);
      }

    } catch (error: any) {
      console.error('❌ Error submitting form:', error);

      let errorMessage = 'Failed to update product';

      if (error.response?.data) {
        const errorData = error.response.data;

        if (errorData?.errors) {
          let details = '';
          for (const [field, messages] of Object.entries(errorData.errors)) {
            const fieldName = field.replace('$', '').replace('.', ' ').trim();
            const msg = Array.isArray(messages) ? messages.join(', ') : messages;
            details += `• ${fieldName}: ${msg}\n`;
          }
          errorMessage = `Validation Failed:\n${details}`;
        } else if (errorData?.message) {
          errorMessage = errorData.message;
        } else if (errorData?.title) {
          errorMessage = errorData.title;
        }
      } else if (error.message) {
        errorMessage = error.message;
      }

      toast.error(errorMessage);

    } finally {
      target.removeAttribute('data-submitting');
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target;
    
    if (name === 'categories') {
      const selectElement = e.target as HTMLSelectElement;
      const selectedOption = selectElement.options[selectElement.selectedIndex];
      
      let displayName = '';
      if (value === '') {
        displayName = '';
      } else {
        displayName = selectedOption.dataset.categoryName || 
                     selectedOption.dataset.displayName || 
                     selectedOption.text.replace(/^[\s\u00A0]*└──\s*/, '').replace(/📁\s*/, '');
      }
      
      setFormData({
        ...formData,
        [name]: value,
        categoryName: displayName
      });
    } 
    else if (name === 'markAsNew') {
      const checked = (e.target as HTMLInputElement).checked;
      setFormData({
        ...formData,
        markAsNew: checked,
        markAsNewStartDate: checked ? formData.markAsNewStartDate : '',
        markAsNewEndDate: checked ? formData.markAsNewEndDate : ''
      });
    }
    else if (type === 'checkbox') {
      const checked = (e.target as HTMLInputElement).checked;
      setFormData({
        ...formData,
        [name]: checked
      });
    } 
    else {
      setFormData({
        ...formData,
        [name]: value
      });
    }
  };

  const addRelatedProduct = (productId: string) => {
    if (!formData.relatedProducts.includes(productId)) {
      setFormData({
        ...formData,
        relatedProducts: [...formData.relatedProducts, productId]
      });
    }
    setSearchTerm('');
  };

  const removeRelatedProduct = (productId: string) => {
    setFormData({
      ...formData,
      relatedProducts: formData.relatedProducts.filter(id => id !== productId)
    });
  };

  const addCrossSellProduct = (productId: string) => {
    if (!formData.crossSellProducts.includes(productId)) {
      setFormData({
        ...formData,
        crossSellProducts: [...formData.crossSellProducts, productId]
      });
    }
    setSearchTermCross('');
  };

  const removeCrossSellProduct = (productId: string) => {
    setFormData({
      ...formData,
      crossSellProducts: formData.crossSellProducts.filter(id => id !== productId)
    });
  };

  const filteredProducts = availableProducts.filter(p =>
    p.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.sku.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const filteredProductsCross = availableProducts.filter(p =>
    p.name.toLowerCase().includes(searchTermCross.toLowerCase()) ||
    p.sku.toLowerCase().includes(searchTermCross.toLowerCase())
  );

  const addAttribute = () => {
    const newAttribute = {
      id: Date.now().toString() + Math.random().toString(36),
      name: '',
      values: ['']
    };
    setAttributes(prevAttributes => [...prevAttributes, newAttribute]);
    
    setTimeout(() => {
      const newInput = document.querySelector(`input[data-attr-id="${newAttribute.id}"]`);
      if (newInput) (newInput as HTMLInputElement).focus();
    }, 100);
  };

  const removeAttribute = (id: string) => {
    setAttributes(prevAttributes => prevAttributes.filter(attr => attr.id !== id));
  };

  const updateAttributeName = (id: string, name: string) => {
    setAttributes(prevAttributes => 
      prevAttributes.map(attr => 
        attr.id === id ? { ...attr, name } : attr
      )
    );
  };

  const updateAttributeValue = (attrId: string, valueIndex: number, value: string) => {
    setAttributes(prevAttributes => 
      prevAttributes.map(attr => {
        if (attr.id === attrId) {
          const newValues = [...attr.values];
          newValues[valueIndex] = value;
          return { ...attr, values: newValues };
        }
        return attr;
      })
    );
  };

  const addAttributeValue = (attrId: string) => {
    setAttributes(prevAttributes => 
      prevAttributes.map(attr => {
        if (attr.id === attrId) {
          return { ...attr, values: [...attr.values, ''] };
        }
        return attr;
      })
    );
  };

  const removeAttributeValue = (attrId: string, valueIndex: number) => {
    setAttributes(prevAttributes => 
      prevAttributes.map(attr => {
        if (attr.id === attrId && attr.values.length > 1) {
          return { ...attr, values: attr.values.filter((_, idx) => idx !== valueIndex) };
        }
        return attr;
      })
    );
  };

  // Generate all possible variants from attributes
  const generateVariants = () => {
    if (attributes.length === 0) {
      toast.warning('Please add attributes first');
      return;
    }

    const validAttributes = attributes.filter(attr => 
      attr.name.trim() && attr.values.some(v => v.trim())
    );

    if (validAttributes.length === 0) {
      toast.warning('Please add valid attribute names and values');
      return;
    }

    // Generate cartesian product of all attribute values
    const combinations: Record<string, string>[] = [];
    
    const generate = (index: number, current: Record<string, string>) => {
      if (index === validAttributes.length) {
        combinations.push({...current});
        return;
      }

      const attr = validAttributes[index];
      const validValues = attr.values.filter(v => v.trim());
      
      for (const value of validValues) {
        current[attr.name] = value;
        generate(index + 1, current);
      }
    };

    generate(0, {});

    // Create variants
    const newVariants: ProductVariant[] = combinations.map((combo, idx) => {
      // Check if variant already exists
      const existing = productVariants.find(v => 
        JSON.stringify(v.attributeCombination) === JSON.stringify(combo)
      );

      if (existing) {
        return existing;
      }

      // Generate SKU
      const variantSuffix = Object.values(combo).join('-').replace(/\s+/g, '-').toUpperCase();
      const variantSku = `${formData.sku}-${variantSuffix}`;

      return {
        id: Date.now().toString() + idx,
        sku: variantSku,
        price: parseFloat(formData.price) || 0,
        stockQuantity: parseInt(formData.stockQuantity) || 0,
        attributeCombination: combo,
        isEnabled: true
      };
    });

    setProductVariants(newVariants);
    toast.success(`Generated ${newVariants.length} variant(s)`);
  };

  const updateVariant = (variantId: string, field: keyof ProductVariant, value: any) => {
    setProductVariants(prevVariants => 
      prevVariants.map(v => 
        v.id === variantId ? { ...v, [field]: value } : v
      )
    );
  };

  const removeVariant = (variantId: string) => {
    setProductVariants(prevVariants => prevVariants.filter(v => v.id !== variantId));
  };

  const handleImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0) return;

    if (!formData.name.trim()) {
      toast.error("Please enter product name before uploading images");
      return;
    }

    if (formData.productImages.length + files.length > 10) {
      toast.error(`Maximum 10 images allowed. You can add ${10 - formData.productImages.length} more.`);
      return;
    }

    setUploadingImages(true);

    try {
      const uploadedImages = await uploadImagesToProductDirect(productId, Array.from(files));
      
      const newImages = uploadedImages.map(img => ({
        id: img.id,
        imageUrl: img.imageUrl,
        altText: img.altText,
        sortOrder: img.sortOrder,
        isMain: img.isMain,
        fileName: img.imageUrl.split('/').pop() || '',
        fileSize: 0,
        file: undefined
      }));

      setFormData(prev => ({
        ...prev,
        productImages: [...prev.productImages, ...newImages]
      }));

      toast.success(`${uploadedImages.length} image(s) uploaded successfully! 📷`);

      if (fileInputRef.current) {
        fileInputRef.current.value = '';
      }

    } catch (error: any) {
      console.error('Error processing images:', error);
      toast.error('Failed to process images. Please try again.');
    } finally {
      setUploadingImages(false);
    }
  };

  const removeImage = async (imageId: string) => {
    const imageToRemove = formData.productImages.find(img => img.id === imageId);
    if (!imageToRemove) return;

    if (imageToRemove.imageUrl.startsWith('blob:')) {
      URL.revokeObjectURL(imageToRemove.imageUrl);
      setFormData({
        ...formData,
        productImages: formData.productImages.filter(img => img.id !== imageId)
      });
      return;
    }

    setIsDeletingImage(true);
    
    try {
      const token = localStorage.getItem('authToken');
      
      const deleteResponse = await fetch(
        `${API_BASE_URL}/api/Products/images/${imageId}`,
        {
          method: 'DELETE',
          headers: {
            ...(token && { 'Authorization': `Bearer ${token}` }),
          },
        }
      );

      if (deleteResponse.ok) {
        toast.success('Image deleted successfully! 🗑️');
        setFormData({
          ...formData,
          productImages: formData.productImages.filter(img => img.id !== imageId)
        });
      } else {
        const errorData = await deleteResponse.json().catch(() => ({ message: 'Failed to delete image' }));
        throw new Error(errorData.message || 'Failed to delete image');
      }

    } catch (error: any) {
      console.error('Error deleting image:', error);
      toast.error(`Failed to delete image: ${error.message}`);
    } finally {
      setIsDeletingImage(false);
    }
  };

  const uploadImagesToProductDirect = async (productId: string, files: File[]): Promise<ProductApiImage[]> => {
    const uploadPromises = files.map(async (file, index) => {
      try {
        const uploadFormData = new FormData();
        uploadFormData.append('images', file);
        uploadFormData.append('altText', file.name.replace(/\.[^/.]+$/, ""));
        uploadFormData.append('sortOrder', (formData.productImages.length + index + 1).toString());
        uploadFormData.append('isMain', (formData.productImages.length === 0 && index === 0).toString());

        const token = localStorage.getItem('authToken');
        const uploadResponse = await fetch(
          `${API_BASE_URL}/api/Products/${productId}/images?name=${encodeURIComponent(formData.name)}`,
          {
            method: 'POST',
            headers: {
              ...(token && { 'Authorization': `Bearer ${token}` }),
            },
            body: uploadFormData,
          }
        );

        if (uploadResponse.ok) {
          const result = await uploadResponse.json();
          if (result && result.success && result.data) {
            return Array.isArray(result.data) ? result.data[0] : result.data;
          }
        }
        throw new Error(`Upload failed for ${file.name}`);
      } catch (error: any) {
        console.error(`Error uploading ${file.name}:`, error);
        toast.error(`Failed to upload ${file.name}`);
        return null;
      }
    });

    const results = await Promise.all(uploadPromises);
    return results.filter(result => result !== null) as ProductApiImage[];
  };

  return (
    <div className="space-y-2">
      {/* Header - keeping your existing header code */}
      <div className="bg-slate-900/50 backdrop-blur-xl border border-slate-800 rounded-2xl p-2">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div className="flex items-center gap-4">
            <Link href="/admin/products">
              <button className="p-2.5 text-slate-400 hover:text-white hover:bg-slate-800 rounded-xl transition-all">
                <ArrowLeft className="h-5 w-5" />
              </button>
            </Link>
            <div>
              <h1 className="text-3xl font-bold tracking-tight bg-gradient-to-r from-violet-400 via-cyan-400 to-pink-400 bg-clip-text text-transparent">
                Edit Product
              </h1>
              <p className="text-sm text-slate-400 mt-1">Update and configure your product details</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <button
              onClick={() => router.push('/admin/products')}
              className="px-5 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-slate-300 hover:bg-slate-800 hover:border-slate-600 transition-all text-sm font-medium"
            >
              Cancel
            </button>
            <button
              type="button"
              onClick={(e) => handleSubmit(e, true)}
              className="px-4 py-2 rounded-xl bg-orange-500/10 border border-orange-500/30 text-orange-400 hover:bg-orange-500/20 hover:border-orange-500/50 transition-all text-sm font-medium flex items-center gap-2"
            >
              <div className="w-2 h-2 bg-orange-400 rounded-full animate-pulse"></div>
              Save as Draft
            </button>
            <button
              type="button"
              onClick={(e) => handleSubmit(e, false)}
              className="px-5 py-2.5 bg-gradient-to-r from-violet-500 to-cyan-500 text-white rounded-xl hover:shadow-lg hover:shadow-violet-500/50 transition-all text-sm flex items-center gap-2 font-semibold"
            >
              <Save className="h-4 w-4" />
              Update Product
            </button>
          </div>
        </div>
      </div>

      {/* Main Tabs - ADD THE "VARIANTS" TAB */}
      <div className="bg-slate-900/50 backdrop-blur-xl border border-slate-800 rounded-2xl p-2">
        <Tabs defaultValue="product-info" className="w-full">
          <div className="border-b border-slate-800 mb-3">
            <TabsList className="flex gap-1 overflow-x-auto pb-px scrollbar-thin scrollbar-thumb-slate-700 scrollbar-track-transparent bg-transparent h-auto p-0">
              <TabsTrigger value="product-info" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Info className="h-4 w-4" />
                Product Info
              </TabsTrigger>
              <TabsTrigger value="prices" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <DollarSign className="h-4 w-4" />
                Prices
              </TabsTrigger>
              <TabsTrigger value="inventory" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Package className="h-4 w-4" />
                Inventory
              </TabsTrigger>
              <TabsTrigger value="shipping" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Truck className="h-4 w-4" />
                Shipping
              </TabsTrigger>
              <TabsTrigger value="related-products" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <LinkIcon className="h-4 w-4" />
                Related
              </TabsTrigger>
              <TabsTrigger value="attributes" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Tag className="h-4 w-4" />
                Attributes
              </TabsTrigger>
              
              {/* NEW: Variants Tab - Only show when product type is grouped */}
              {formData.productType === 'grouped' && (
                <TabsTrigger value="variants" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                  <Layers className="h-4 w-4" />
                  Variants
                  {productVariants.length > 0 && (
                    <span className="ml-1 px-1.5 py-0.5 bg-violet-500 text-white text-xs rounded-full">
                      {productVariants.length}
                    </span>
                  )}
                </TabsTrigger>
              )}

              <TabsTrigger value="seo" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Globe className="h-4 w-4" />
                SEO
              </TabsTrigger>
              <TabsTrigger value="pictures" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Image className="h-4 w-4" />
                Pictures
              </TabsTrigger>
              <TabsTrigger value="videos" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <Video className="h-4 w-4" />
                Videos
              </TabsTrigger>
              <TabsTrigger value="specifications" className="flex items-center gap-2 px-4 py-2.5 text-sm font-medium text-slate-400 hover:text-violet-400 border-b-2 border-transparent data-[state=active]:border-violet-500 data-[state=active]:text-violet-400 data-[state=active]:bg-slate-800/50 whitespace-nowrap transition-all rounded-t-lg">
                <BarChart3 className="h-4 w-4" />
                Specifications
              </TabsTrigger>
            </TabsList>
          </div>

          {/* Keep all your existing TabsContent from the file you provided */}
          {/* I'll only add the NEW Variants Tab below */}

          {/* NEW: VARIANTS TAB CONTENT */}
          <TabsContent value="variants" className="space-y-2 mt-2">
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-lg font-semibold text-white">Product Variants</h3>
                  <p className="text-sm text-slate-400">
                    Create product variations based on attributes (size, color, etc.)
                  </p>
                </div>
                <button
                  onClick={generateVariants}
                  disabled={attributes.length === 0}
                  className={`px-4 py-2 rounded-lg text-sm flex items-center gap-2 font-medium transition-all ${
                    attributes.length === 0
                      ? 'bg-slate-800/50 border border-slate-700 text-slate-500 cursor-not-allowed'
                      : 'bg-violet-500/10 border border-violet-500/30 text-violet-400 hover:bg-violet-500/20'
                  }`}
                >
                  <Layers className="h-4 w-4" />
                  Generate Variants
                </button>
              </div>

              {attributes.length === 0 && (
                <div className="text-center py-12 border-2 border-dashed border-slate-700 rounded-xl bg-slate-800/20">
                  <Tag className="mx-auto h-16 w-16 text-slate-600 mb-4" />
                  <h3 className="text-lg font-semibold text-white mb-2">No Attributes Defined</h3>
                  <p className="text-slate-400 mb-4">
                    Go to the Attributes tab to add product attributes first
                  </p>
                </div>
              )}

              {attributes.length > 0 && productVariants.length === 0 && (
                <div className="text-center py-12 border-2 border-dashed border-slate-700 rounded-xl bg-slate-800/20">
                  <Layers className="mx-auto h-16 w-16 text-slate-600 mb-4" />
                  <h3 className="text-lg font-semibold text-white mb-2">No Variants Generated</h3>
                  <p className="text-slate-400 mb-4">
                    Click "Generate Variants" to create all possible combinations
                  </p>
                </div>
              )}

              {/* Variants Table */}
              {productVariants.length > 0 && (
                <div className="space-y-4">
                  <div className="bg-violet-500/10 border border-violet-500/30 rounded-xl p-4">
                    <p className="text-sm text-slate-300">
                      <strong>{productVariants.length} variant(s)</strong> generated from your attributes.
                      Each variant has its own SKU, price, and stock quantity.
                    </p>
                  </div>

                  <div className="overflow-x-auto border border-slate-700 rounded-xl">
                    <table className="w-full">
                      <thead className="bg-slate-800/50 border-b border-slate-700">
                        <tr>
                          <th className="text-left py-3 px-4 text-sm font-medium text-slate-300">Variant</th>
                          <th className="text-left py-3 px-4 text-sm font-medium text-slate-300">SKU</th>
                          <th className="text-center py-3 px-4 text-sm font-medium text-slate-300">Price (₹)</th>
                          <th className="text-center py-3 px-4 text-sm font-medium text-slate-300">Stock</th>
                          <th className="text-center py-3 px-4 text-sm font-medium text-slate-300">Status</th>
                          <th className="text-center py-3 px-4 text-sm font-medium text-slate-300">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        {productVariants.map((variant) => (
                          <tr key={variant.id} className="border-b border-slate-700 hover:bg-slate-800/30 transition-colors">
                            <td className="py-3 px-4">
                              <div className="space-y-1">
                                {Object.entries(variant.attributeCombination).map(([key, value]) => (
                                  <div key={key} className="flex items-center gap-2 text-sm">
                                    <span className="text-slate-400">{key}:</span>
                                    <span className="text-white font-medium">{value}</span>
                                  </div>
                                ))}
                              </div>
                            </td>
                            <td className="py-3 px-4">
                              <input
                                type="text"
                                value={variant.sku}
                                onChange={(e) => updateVariant(variant.id, 'sku', e.target.value)}
                                className="w-full px-2 py-1 text-sm bg-slate-800/50 border border-slate-700 rounded text-white focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
                              />
                            </td>
                            <td className="py-3 px-4">
                              <input
                                type="number"
                                value={variant.price}
                                onChange={(e) => updateVariant(variant.id, 'price', parseFloat(e.target.value) || 0)}
                                step="0.01"
                                className="w-24 px-2 py-1 text-sm bg-slate-800/50 border border-slate-700 rounded text-white text-center focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
                              />
                            </td>
                            <td className="py-3 px-4">
                              <input
                                type="number"
                                value={variant.stockQuantity}
                                onChange={(e) => updateVariant(variant.id, 'stockQuantity', parseInt(e.target.value) || 0)}
                                className="w-20 px-2 py-1 text-sm bg-slate-800/50 border border-slate-700 rounded text-white text-center focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
                              />
                            </td>
                            <td className="py-3 px-4 text-center">
                              <label className="inline-flex items-center cursor-pointer">
                                <input
                                  type="checkbox"
                                  checked={variant.isEnabled}
                                  onChange={(e) => updateVariant(variant.id, 'isEnabled', e.target.checked)}
                                  className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
                                />
                                <span className={`ml-2 text-sm ${variant.isEnabled ? 'text-green-400' : 'text-slate-400'}`}>
                                  {variant.isEnabled ? 'Active' : 'Disabled'}
                                </span>
                              </label>
                            </td>
                            <td className="py-3 px-4 text-center">
                              <button
                                onClick={() => removeVariant(variant.id)}
                                className="p-2 text-red-400 hover:bg-red-500/20 rounded-lg transition-all"
                                title="Delete Variant"
                              >
                                <X className="h-4 w-4" />
                              </button>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}

              {/* Info Box */}
              <div className="bg-violet-500/10 border border-violet-500/30 rounded-xl p-4">
                <h4 className="font-semibold text-sm text-violet-400 mb-2">How Variants Work</h4>
                <ul className="text-sm text-slate-300 space-y-1">
                  <li>• Define attributes (Size, Color, etc.) in the Attributes tab</li>
                  <li>• Click "Generate Variants" to create all combinations</li>
                  <li>• Each variant has its own SKU, price, and stock quantity</li>
                  <li>• Customers can select variants on the product page</li>
                  <li>• Disable variants you don't want to sell</li>
                </ul>
              </div>
            </div>
          </TabsContent>
{/* Product Info Tab */}
<TabsContent value="product-info" className="space-y-2 mt-2">
  <div className="grid grid-cols-1 gap-6">
    {/* Product Name */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Package className="h-4 w-4 text-violet-400" />
        Product Name
        <span className="text-red-400">*</span>
      </label>
      <input
        type="text"
        name="name"
        value={formData.name}
        onChange={handleChange}
        placeholder="Enter product name"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        required
      />
    </div>

    {/* Short Description */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <FileText className="h-4 w-4 text-cyan-400" />
        Short Description
      </label>
      <textarea
        name="shortDescription"
        value={formData.shortDescription}
        onChange={handleChange}
        rows={3}
        placeholder="Brief product description (shown in listings)"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all resize-none"
      />
    </div>

    {/* Full Description */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <FileText className="h-4 w-4 text-pink-400" />
        Full Description
      </label>
      <ProductDescriptionEditor
        value={formData.fullDescription}
        onChange={(value) => setFormData({ ...formData, fullDescription: value })}
      />
    </div>

    {/* SKU, Brand, Category - Row */}
    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Tag className="h-4 w-4 text-orange-400" />
          SKU
          <span className="text-red-400">*</span>
        </label>
        <input
          type="text"
          name="sku"
          value={formData.sku}
          onChange={handleChange}
          placeholder="Product SKU"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
          required
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Tag className="h-4 w-4 text-blue-400" />
          Brand
        </label>
        <select
          name="brand"
          value={formData.brand}
          onChange={handleChange}
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        >
          <option value="">Select Brand</option>
          {dropdownsData.brands.map((brand) => (
            <option key={brand.id} value={brand.id}>
              {brand.name}
            </option>
          ))}
        </select>
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-green-400" />
          Category
        </label>
        <select
          name="categories"
          value={formData.categories}
          onChange={handleChange}
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        >
          <option value="">Select Category</option>
          {renderCategoryOptions(dropdownsData.categories)}
        </select>
      </div>
    </div>

    {/* GTIN, Manufacturer Part Number */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Tag className="h-4 w-4 text-indigo-400" />
          GTIN
        </label>
        <input
          type="text"
          name="gtin"
          value={formData.gtin}
          onChange={handleChange}
          placeholder="Global Trade Item Number"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Tag className="h-4 w-4 text-purple-400" />
          Manufacturer Part Number
        </label>
        <input
          type="text"
          name="manufacturerPartNumber"
          value={formData.manufacturerPartNumber}
          onChange={handleChange}
          placeholder="MPN"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Product Type, Display Order */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-yellow-400" />
          Product Type
        </label>
        <select
          name="productType"
          value={formData.productType}
          onChange={handleChange}
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        >
          <option value="simple">Simple Product</option>
          <option value="grouped">Grouped Product (with variants)</option>
        </select>
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <BarChart3 className="h-4 w-4 text-cyan-400" />
          Display Order
        </label>
        <input
          type="number"
          name="displayOrder"
          value={formData.displayOrder}
          onChange={handleChange}
          placeholder="1"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Product Tags */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Tag className="h-4 w-4 text-pink-400" />
        Product Tags
      </label>
      <input
        type="text"
        name="productTags"
        value={formData.productTags}
        onChange={handleChange}
        placeholder="tag1, tag2, tag3"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
      <p className="text-xs text-slate-500">Separate tags with commas</p>
    </div>

    {/* Admin Comment */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <FileText className="h-4 w-4 text-amber-400" />
        Admin Comment
      </label>
      <textarea
        name="adminComment"
        value={formData.adminComment}
        onChange={handleChange}
        rows={3}
        placeholder="Internal notes (not visible to customers)"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all resize-none"
      />
    </div>

    {/* Checkboxes */}
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="published"
          checked={formData.published}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Published</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="visibleIndividually"
          checked={formData.visibleIndividually}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Visible Individually</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="showOnHomepage"
          checked={formData.showOnHomepage}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Show on Homepage</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="allowCustomerReviews"
          checked={formData.allowCustomerReviews}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Allow Customer Reviews</span>
      </label>
    </div>
  </div>
</TabsContent>

{/* Prices Tab */}
<TabsContent value="prices" className="space-y-2 mt-2">
  <div className="grid grid-cols-1 gap-6">
    {/* Price, Old Price, Cost */}
    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <DollarSign className="h-4 w-4 text-green-400" />
          Price
          <span className="text-red-400">*</span>
        </label>
        <input
          type="number"
          name="price"
          value={formData.price}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
          required
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <DollarSign className="h-4 w-4 text-orange-400" />
          Old Price
        </label>
        <input
          type="number"
          name="oldPrice"
          value={formData.oldPrice}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <DollarSign className="h-4 w-4 text-blue-400" />
          Cost Price
        </label>
        <input
          type="number"
          name="cost"
          value={formData.cost}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Customer Enters Price */}
    <div className="space-y-4 p-4 bg-slate-800/30 border border-slate-700 rounded-xl">
      <label className="flex items-center gap-3 cursor-pointer">
        <input
          type="checkbox"
          name="customerEntersPrice"
          checked={formData.customerEntersPrice}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Customer Enters Price</span>
      </label>

      {formData.customerEntersPrice && (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
          <div className="space-y-2">
            <label className="text-sm font-medium text-slate-300">Minimum Price</label>
            <input
              type="number"
              name="minimumCustomerEnteredPrice"
              value={formData.minimumCustomerEnteredPrice}
              onChange={handleChange}
              step="0.01"
              placeholder="0.00"
              className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
          </div>

          <div className="space-y-2">
            <label className="text-sm font-medium text-slate-300">Maximum Price</label>
            <input
              type="number"
              name="maximumCustomerEnteredPrice"
              value={formData.maximumCustomerEnteredPrice}
              onChange={handleChange}
              step="0.01"
              placeholder="0.00"
              className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
          </div>
        </div>
      )}
    </div>

    {/* Mark as New */}
    <div className="space-y-4 p-4 bg-slate-800/30 border border-slate-700 rounded-xl">
      <label className="flex items-center gap-3 cursor-pointer">
        <input
          type="checkbox"
          name="markAsNew"
          checked={formData.markAsNew}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Mark as New</span>
      </label>

      {formData.markAsNew && (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
          <div className="space-y-2">
            <label className="text-sm font-medium text-slate-300">Start Date</label>
            <input
              type="datetime-local"
              name="markAsNewStartDate"
              value={formData.markAsNewStartDate}
              onChange={handleChange}
              className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
          </div>

          <div className="space-y-2">
            <label className="text-sm font-medium text-slate-300">End Date</label>
            <input
              type="datetime-local"
              name="markAsNewEndDate"
              value={formData.markAsNewEndDate}
              onChange={handleChange}
              className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
          </div>
        </div>
      )}
    </div>

    {/* Availability Dates */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Calendar className="h-4 w-4 text-green-400" />
          Available From
        </label>
        <input
          type="datetime-local"
          name="availableStartDate"
          value={formData.availableStartDate}
          onChange={handleChange}
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Calendar className="h-4 w-4 text-red-400" />
          Available Until
        </label>
        <input
          type="datetime-local"
          name="availableEndDate"
          value={formData.availableEndDate}
          onChange={handleChange}
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Price Options Checkboxes */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="disableBuyButton"
          checked={formData.disableBuyButton}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Disable Buy Button</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="disableWishlistButton"
          checked={formData.disableWishlistButton}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Disable Wishlist Button</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="callForPrice"
          checked={formData.callForPrice}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Call for Price</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="taxExempt"
          checked={formData.taxExempt}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Tax Exempt</span>
      </label>
    </div>
  </div>
</TabsContent>

{/* Inventory Tab */}
<TabsContent value="inventory" className="space-y-2 mt-2">
  <div className="grid grid-cols-1 gap-6">
    {/* Manage Inventory */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Package className="h-4 w-4 text-violet-400" />
        Inventory Method
      </label>
      <select
        name="manageInventory"
        value={formData.manageInventory}
        onChange={handleChange}
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      >
        <option value="dont-track">Don't track inventory</option>
        <option value="track">Track inventory</option>
      </select>
    </div>

    {/* Stock Quantity, Min Stock */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-green-400" />
          Stock Quantity
        </label>
        <input
          type="number"
          name="stockQuantity"
          value={formData.stockQuantity}
          onChange={handleChange}
          placeholder="0"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-orange-400" />
          Minimum Stock Quantity
        </label>
        <input
          type="number"
          name="minStockQuantity"
          value={formData.minStockQuantity}
          onChange={handleChange}
          placeholder="0"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Notify Below Quantity */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Package className="h-4 w-4 text-red-400" />
        Notify Admin Below Quantity
      </label>
      <input
        type="number"
        name="notifyAdminForQuantityBelow"
        value={formData.notifyAdminForQuantityBelow}
        onChange={handleChange}
        placeholder="1"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
    </div>

    {/* Backorder Mode */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Package className="h-4 w-4 text-blue-400" />
        Backorder Mode
      </label>
      <select
        name="backorders"
        value={formData.backorders}
        onChange={handleChange}
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      >
        <option value="no-backorders">No backorders</option>
        <option value="allow-qty-below-0">Allow qty below 0</option>
        <option value="notify-customer">Notify customer</option>
      </select>
    </div>

    {/* Min/Max Cart Quantity */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <ShoppingCart className="h-4 w-4 text-cyan-400" />
          Minimum Cart Quantity
        </label>
        <input
          type="number"
          name="minCartQuantity"
          value={formData.minCartQuantity}
          onChange={handleChange}
          placeholder="1"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <ShoppingCart className="h-4 w-4 text-pink-400" />
          Maximum Cart Quantity
        </label>
        <input
          type="number"
          name="maxCartQuantity"
          value={formData.maxCartQuantity}
          onChange={handleChange}
          placeholder="10000"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Allowed Quantities */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Package className="h-4 w-4 text-purple-400" />
        Allowed Quantities
      </label>
      <input
        type="text"
        name="allowedQuantities"
        value={formData.allowedQuantities}
        onChange={handleChange}
        placeholder="e.g., 1, 5, 10, 20"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
      <p className="text-xs text-slate-500">Comma-separated list of allowed quantities</p>
    </div>

    {/* Inventory Checkboxes */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="allowBackorder"
          checked={formData.allowBackorder}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Allow Backorder</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="notReturnable"
          checked={formData.notReturnable}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Not Returnable</span>
      </label>
    </div>
  </div>
</TabsContent>

{/* Shipping Tab */}
<TabsContent value="shipping" className="space-y-2 mt-2">
  <div className="grid grid-cols-1 gap-6">
    {/* Shipping Enabled */}
    <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
      <input
        type="checkbox"
        name="isShipEnabled"
        checked={formData.isShipEnabled}
        onChange={handleChange}
        className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
      />
      <span className="text-sm text-slate-300 font-medium">Shipping Enabled</span>
    </label>

    {/* Weight, Dimensions */}
    <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-violet-400" />
          Weight (kg)
        </label>
        <input
          type="number"
          name="weight"
          value={formData.weight}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-blue-400" />
          Length (cm)
        </label>
        <input
          type="number"
          name="length"
          value={formData.length}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-green-400" />
          Width (cm)
        </label>
        <input
          type="number"
          name="width"
          value={formData.width}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      <div className="space-y-2">
        <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
          <Package className="h-4 w-4 text-orange-400" />
          Height (cm)
        </label>
        <input
          type="number"
          name="height"
          value={formData.height}
          onChange={handleChange}
          step="0.01"
          placeholder="0.00"
          className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>
    </div>

    {/* Additional Shipping Charge */}
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <DollarSign className="h-4 w-4 text-cyan-400" />
        Additional Shipping Charge
      </label>
      <input
        type="number"
        name="additionalShippingCharge"
        value={formData.additionalShippingCharge}
        onChange={handleChange}
        step="0.01"
        placeholder="0.00"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
    </div>

    {/* Shipping Options */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="isFreeShipping"
          checked={formData.isFreeShipping}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Free Shipping</span>
      </label>

      <label className="flex items-center gap-3 p-4 bg-slate-800/30 border border-slate-700 rounded-xl cursor-pointer hover:bg-slate-800/50 transition-all">
        <input
          type="checkbox"
          name="shipSeparately"
          checked={formData.shipSeparately}
          onChange={handleChange}
          className="rounded bg-slate-800/50 border-slate-700 text-violet-500 focus:ring-violet-500 focus:ring-offset-slate-900"
        />
        <span className="text-sm text-slate-300 font-medium">Ship Separately</span>
      </label>
    </div>
  </div>
</TabsContent>

{/* Related Products Tab */}
<TabsContent value="related-products" className="space-y-6 mt-2">
  {/* Related Products */}
  <div className="space-y-4">
    <h3 className="text-lg font-semibold text-white flex items-center gap-2">
      <LinkIcon className="h-5 w-5 text-violet-400" />
      Related Products
    </h3>
    
    <div className="space-y-2">
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-5 w-5 text-slate-500" />
        <input
          type="text"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          placeholder="Search products to add..."
          className="w-full pl-11 pr-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      {searchTerm && filteredProducts.length > 0 && (
        <div className="max-h-60 overflow-y-auto border border-slate-700 rounded-xl bg-slate-800/50">
          {filteredProducts.slice(0, 10).map((product) => (
            <button
              key={product.id}
              onClick={() => addRelatedProduct(product.id)}
              className="w-full px-4 py-3 text-left hover:bg-slate-700/50 transition-colors flex items-center justify-between"
            >
              <div>
                <p className="text-sm text-white font-medium">{product.name}</p>
                <p className="text-xs text-slate-400">{product.sku} - {product.price}</p>
              </div>
            </button>
          ))}
        </div>
      )}
    </div>

    <div className="flex flex-wrap gap-2">
      {formData.relatedProducts.map((productId) => {
        const product = availableProducts.find(p => p.id === productId);
        return product ? (
          <div
            key={productId}
            className="flex items-center gap-2 px-3 py-2 bg-violet-500/10 border border-violet-500/30 rounded-lg"
          >
            <span className="text-sm text-white">{product.name}</span>
            <button
              onClick={() => removeRelatedProduct(productId)}
              className="text-red-400 hover:text-red-300"
            >
              <X className="h-4 w-4" />
            </button>
          </div>
        ) : null;
      })}
    </div>
  </div>

  {/* Cross-Sell Products */}
  <div className="space-y-4">
    <h3 className="text-lg font-semibold text-white flex items-center gap-2">
      <ShoppingCart className="h-5 w-5 text-cyan-400" />
      Cross-Sell Products
    </h3>
    
    <div className="space-y-2">
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-5 w-5 text-slate-500" />
        <input
          type="text"
          value={searchTermCross}
          onChange={(e) => setSearchTermCross(e.target.value)}
          placeholder="Search products to add..."
          className="w-full pl-11 pr-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
        />
      </div>

      {searchTermCross && filteredProductsCross.length > 0 && (
        <div className="max-h-60 overflow-y-auto border border-slate-700 rounded-xl bg-slate-800/50">
          {filteredProductsCross.slice(0, 10).map((product) => (
            <button
              key={product.id}
              onClick={() => addCrossSellProduct(product.id)}
              className="w-full px-4 py-3 text-left hover:bg-slate-700/50 transition-colors flex items-center justify-between"
            >
              <div>
                <p className="text-sm text-white font-medium">{product.name}</p>
                <p className="text-xs text-slate-400">{product.sku} - {product.price}</p>
              </div>
            </button>
          ))}
        </div>
      )}
    </div>

    <div className="flex flex-wrap gap-2">
      {formData.crossSellProducts.map((productId) => {
        const product = availableProducts.find(p => p.id === productId);
        return product ? (
          <div
            key={productId}
            className="flex items-center gap-2 px-3 py-2 bg-cyan-500/10 border border-cyan-500/30 rounded-lg"
          >
            <span className="text-sm text-white">{product.name}</span>
            <button
              onClick={() => removeCrossSellProduct(productId)}
              className="text-red-400 hover:text-red-300"
            >
              <X className="h-4 w-4" />
            </button>
          </div>
        ) : null;
      })}
    </div>
  </div>
</TabsContent>

{/* Attributes Tab */}
<TabsContent value="attributes" className="space-y-2 mt-2">
  <div className="space-y-4">
    <div className="flex items-center justify-between">
      <div>
        <h3 className="text-lg font-semibold text-white">Product Attributes</h3>
        <p className="text-sm text-slate-400">
          Define product variations (e.g., Size, Color, Material)
        </p>
      </div>
      <button
        onClick={addAttribute}
        className="px-4 py-2 bg-violet-500/10 border border-violet-500/30 text-violet-400 rounded-lg hover:bg-violet-500/20 transition-all text-sm flex items-center gap-2 font-medium"
      >
        <Tag className="h-4 w-4" />
        Add Attribute
      </button>
    </div>

    {attributes.length === 0 && (
      <div className="text-center py-12 border-2 border-dashed border-slate-700 rounded-xl bg-slate-800/20">
        <Tag className="mx-auto h-16 w-16 text-slate-600 mb-4" />
        <h3 className="text-lg font-semibold text-white mb-2">No Attributes Yet</h3>
        <p className="text-slate-400 mb-4">
          Add attributes to create product variations
        </p>
        <button
          onClick={addAttribute}
          className="px-4 py-2 bg-violet-500/10 border border-violet-500/30 text-violet-400 rounded-lg hover:bg-violet-500/20 transition-all text-sm font-medium"
        >
          Add First Attribute
        </button>
      </div>
    )}

    {attributes.map((attr, attrIndex) => (
      <div key={attr.id} className="p-4 bg-slate-800/30 border border-slate-700 rounded-xl space-y-3">
        <div className="flex items-center gap-3">
          <input
            type="text"
            value={attr.name}
            onChange={(e) => updateAttributeName(attr.id, e.target.value)}
            placeholder="Attribute name (e.g., Size, Color)"
            data-attr-id={attr.id}
            className="flex-1 px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
          />
          <button
            onClick={() => removeAttribute(attr.id)}
            className="p-2.5 text-red-400 hover:bg-red-500/20 rounded-lg transition-all"
            title="Remove Attribute"
          >
            <X className="h-5 w-5" />
          </button>
        </div>

        <div className="space-y-2">
          <p className="text-sm text-slate-400 font-medium">Values:</p>
          {attr.values.map((value, valueIndex) => (
            <div key={valueIndex} className="flex items-center gap-2">
              <input
                type="text"
                value={value}
                onChange={(e) => updateAttributeValue(attr.id, valueIndex, e.target.value)}
                placeholder={`Value ${valueIndex + 1}`}
                className="flex-1 px-3 py-2 bg-slate-800/50 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all text-sm"
              />
              {attr.values.length > 1 && (
                <button
                  onClick={() => removeAttributeValue(attr.id, valueIndex)}
                  className="p-2 text-red-400 hover:bg-red-500/20 rounded-lg transition-all"
                  title="Remove Value"
                >
                  <X className="h-4 w-4" />
                </button>
              )}
            </div>
          ))}
          <button
            onClick={() => addAttributeValue(attr.id)}
            className="w-full py-2 text-sm text-violet-400 border border-dashed border-violet-500/30 rounded-lg hover:bg-violet-500/10 transition-all"
          >
            + Add Value
          </button>
        </div>
      </div>
    ))}
  </div>
</TabsContent>

{/* SEO Tab */}
<TabsContent value="seo" className="space-y-2 mt-2">
  <div className="grid grid-cols-1 gap-6">
    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Globe className="h-4 w-4 text-violet-400" />
        Meta Title
      </label>
      <input
        type="text"
        name="metaTitle"
        value={formData.metaTitle}
        onChange={handleChange}
        placeholder="SEO meta title"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
    </div>

    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Globe className="h-4 w-4 text-cyan-400" />
        Meta Keywords
      </label>
      <input
        type="text"
        name="metaKeywords"
        value={formData.metaKeywords}
        onChange={handleChange}
        placeholder="keyword1, keyword2, keyword3"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
    </div>

    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <Globe className="h-4 w-4 text-pink-400" />
        Meta Description
      </label>
      <textarea
        name="metaDescription"
        value={formData.metaDescription}
        onChange={handleChange}
        rows={4}
        placeholder="SEO meta description"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all resize-none"
      />
    </div>

    <div className="space-y-2">
      <label className="flex items-center gap-2 text-sm font-medium text-slate-300">
        <LinkIcon className="h-4 w-4 text-green-400" />
        SEO Friendly URL
      </label>
      <input
        type="text"
        name="searchEngineFriendlyPageName"
        value={formData.searchEngineFriendlyPageName}
        onChange={handleChange}
        placeholder="product-url-slug"
        className="w-full px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
      />
    </div>
  </div>
</TabsContent>

{/* Pictures Tab */}
<TabsContent value="pictures" className="space-y-2 mt-2">
  <div className="space-y-4">
    <div className="flex items-center justify-between">
      <div>
        <h3 className="text-lg font-semibold text-white">Product Images</h3>
        <p className="text-sm text-slate-400">Upload up to 10 images</p>
      </div>
      <button
        onClick={() => fileInputRef.current?.click()}
        disabled={uploadingImages || formData.productImages.length >= 10}
        className={`px-4 py-2 rounded-lg text-sm flex items-center gap-2 font-medium transition-all ${
          uploadingImages || formData.productImages.length >= 10
            ? 'bg-slate-800/50 border border-slate-700 text-slate-500 cursor-not-allowed'
            : 'bg-violet-500/10 border border-violet-500/30 text-violet-400 hover:bg-violet-500/20'
        }`}
      >
        <Upload className="h-4 w-4" />
        {uploadingImages ? 'Uploading...' : 'Upload Images'}
      </button>
      <input
        ref={fileInputRef}
        type="file"
        multiple
        accept="image/*"
        onChange={handleImageUpload}
        className="hidden"
      />
    </div>

    {formData.productImages.length === 0 ? (
      <div className="text-center py-12 border-2 border-dashed border-slate-700 rounded-xl bg-slate-800/20">
        <Image className="mx-auto h-16 w-16 text-slate-600 mb-4" />
        <h3 className="text-lg font-semibold text-white mb-2">No Images Yet</h3>
        <p className="text-slate-400 mb-4">Upload product images to showcase your product</p>
      </div>
    ) : (
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {formData.productImages.map((image) => (
          <div key={image.id} className="relative group">
            <div className="aspect-square rounded-xl overflow-hidden bg-slate-800/50 border border-slate-700">
              <img
                src={`${API_BASE_URL.replace(/\/$/, '')}/${image.imageUrl.replace(/^\//, '')}`}
                alt={image.altText}
                className="w-full h-full object-cover"
              />
            </div>
            {image.isMain && (
              <div className="absolute top-2 left-2 px-2 py-1 bg-violet-500 text-white text-xs rounded-lg font-medium">
                Main
              </div>
            )}
            <button
              onClick={() => removeImage(image.id)}
              disabled={isDeletingImage}
              className="absolute top-2 right-2 p-2 bg-red-500 text-white rounded-lg opacity-0 group-hover:opacity-100 transition-opacity"
            >
              <X className="h-4 w-4" />
            </button>
          </div>
        ))}
      </div>
    )}
  </div>
</TabsContent>

{/* Videos Tab */}
<TabsContent value="videos" className="space-y-2 mt-2">
  <div className="space-y-4">
    <div className="flex items-center justify-between">
      <div>
        <h3 className="text-lg font-semibold text-white">Product Videos</h3>
        <p className="text-sm text-slate-400">Add YouTube or video URLs</p>
      </div>
      <button
        onClick={() => {
          setFormData({
            ...formData,
            videoUrls: [...formData.videoUrls, '']
          });
        }}
        className="px-4 py-2 bg-violet-500/10 border border-violet-500/30 text-violet-400 rounded-lg hover:bg-violet-500/20 transition-all text-sm flex items-center gap-2 font-medium"
      >
        <Video className="h-4 w-4" />
        Add Video URL
      </button>
    </div>

    {formData.videoUrls.length === 0 ? (
      <div className="text-center py-12 border-2 border-dashed border-slate-700 rounded-xl bg-slate-800/20">
        <Video className="mx-auto h-16 w-16 text-slate-600 mb-4" />
        <h3 className="text-lg font-semibold text-white mb-2">No Videos Yet</h3>
        <p className="text-slate-400 mb-4">Add product video URLs</p>
      </div>
    ) : (
      <div className="space-y-3">
        {formData.videoUrls.map((url, index) => (
          <div key={index} className="flex items-center gap-2">
            <input
              type="url"
              value={url}
              onChange={(e) => {
                const newUrls = [...formData.videoUrls];
                newUrls[index] = e.target.value;
                setFormData({ ...formData, videoUrls: newUrls });
              }}
              placeholder="https://youtube.com/watch?v=..."
              className="flex-1 px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
            <button
              onClick={() => {
                setFormData({
                  ...formData,
                  videoUrls: formData.videoUrls.filter((_, i) => i !== index)
                });
              }}
              className="p-2.5 text-red-400 hover:bg-red-500/20 rounded-lg transition-all"
            >
              <X className="h-5 w-5" />
            </button>
          </div>
        ))}
      </div>
    )}
  </div>
</TabsContent>

{/* Specifications Tab */}
<TabsContent value="specifications" className="space-y-2 mt-2">
  <div className="space-y-4">
    <div className="flex items-center justify-between">
      <div>
        <h3 className="text-lg font-semibold text-white">Product Specifications</h3>
        <p className="text-sm text-slate-400">Technical details and specs</p>
      </div>
      <button
        onClick={() => {
          setFormData({
            ...formData,
            specifications: [
              ...formData.specifications,
              {
                id: Date.now().toString(),
                name: '',
                value: '',
                displayOrder: formData.specifications.length + 1
              }
            ]
          });
        }}
        className="px-4 py-2 bg-violet-500/10 border border-violet-500/30 text-violet-400 rounded-lg hover:bg-violet-500/20 transition-all text-sm flex items-center gap-2 font-medium"
      >
        <BarChart3 className="h-4 w-4" />
        Add Specification
      </button>
    </div>

    {formData.specifications.length === 0 ? (
      <div className="text-center py-12 border-2 border-dashed border-slate-700 rounded-xl bg-slate-800/20">
        <BarChart3 className="mx-auto h-16 w-16 text-slate-600 mb-4" />
        <h3 className="text-lg font-semibold text-white mb-2">No Specifications Yet</h3>
        <p className="text-slate-400 mb-4">Add technical specifications</p>
      </div>
    ) : (
      <div className="space-y-3">
        {formData.specifications.map((spec, index) => (
          <div key={spec.id} className="flex items-center gap-3">
            <input
              type="text"
              value={spec.name}
              onChange={(e) => {
                const newSpecs = [...formData.specifications];
                newSpecs[index].name = e.target.value;
                setFormData({ ...formData, specifications: newSpecs });
              }}
              placeholder="Spec name (e.g., RAM)"
              className="flex-1 px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
            <input
              type="text"
              value={spec.value}
              onChange={(e) => {
                const newSpecs = [...formData.specifications];
                newSpecs[index].value = e.target.value;
                setFormData({ ...formData, specifications: newSpecs });
              }}
              placeholder="Value (e.g., 8GB DDR4)"
              className="flex-1 px-4 py-2.5 bg-slate-800/50 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:border-transparent transition-all"
            />
            <button
              onClick={() => {
                setFormData({
                  ...formData,
                  specifications: formData.specifications.filter((_, i) => i !== index)
                });
              }}
              className="p-2.5 text-red-400 hover:bg-red-500/20 rounded-lg transition-all"
            >
              <X className="h-5 w-5" />
            </button>
          </div>
        ))}
      </div>
    )}
  </div>
</TabsContent>

          {/* PASTE ALL YOUR EXISTING TabsContent COMPONENTS HERE FROM THE FILE */}
          {/* I'm keeping them as-is from your original code */}
          {/* Product Info, Prices, Inventory, Shipping, Related Products, Attributes, SEO, Pictures, Videos, Specifications */}
          
        </Tabs>
      </div>
    </div>
  );
}
